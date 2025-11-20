"""
Workflow API endpoints
Provides access to scan workflow graphs and traces
"""
from fastapi import APIRouter, HTTPException
from typing import List

from models.schemas import (
    WorkflowGraph,
    WorkflowTimelineEvent,
    WorkflowExportRequest,
    WorkflowExportResponse
)
from services.workflow_analyzer import workflow_analyzer

router = APIRouter(prefix="/api/v1/scan", tags=["workflow"])


@router.get("/{scan_id}/workflow", response_model=WorkflowGraph)
async def get_workflow_graph(scan_id: str):
    """
    Get complete workflow graph for a scan

    Returns all nodes, edges, traces, and statistics for the workflow
    """
    workflow = workflow_analyzer.get_workflow_graph(scan_id)

    if not workflow:
        raise HTTPException(
            status_code=404,
            detail=f"No workflow found for scan {scan_id}"
        )

    return workflow


@router.get("/{scan_id}/workflow/timeline", response_model=List[WorkflowTimelineEvent])
async def get_workflow_timeline(scan_id: str):
    """
    Get chronological timeline of workflow events

    Returns events sorted by timestamp
    """
    timeline = workflow_analyzer.get_workflow_timeline(scan_id)

    if not timeline:
        raise HTTPException(
            status_code=404,
            detail=f"No workflow timeline found for scan {scan_id}"
        )

    return timeline


@router.post("/{scan_id}/workflow/export", response_model=WorkflowExportResponse)
async def export_workflow(scan_id: str, request: WorkflowExportRequest):
    """
    Export workflow in specified format

    Supported formats:
    - json: JSON representation of workflow graph
    - mermaid: Mermaid diagram syntax
    """
    try:
        exported_data = workflow_analyzer.export_workflow(scan_id, request.format)

        if not exported_data:
            raise HTTPException(
                status_code=404,
                detail=f"No workflow found for scan {scan_id}"
            )

        return WorkflowExportResponse(
            format=request.format,
            data=exported_data
        )

    except ValueError as e:
        raise HTTPException(status_code=400, detail=str(e))
    except Exception as e:
        raise HTTPException(status_code=500, detail=f"Export failed: {str(e)}")


@router.delete("/{scan_id}/workflow")
async def clear_workflow(scan_id: str):
    """
    Clear workflow data for a scan

    Useful for freeing memory after scan completion
    """
    workflow_analyzer.clear_workflow(scan_id)

    return {"message": f"Workflow data cleared for scan {scan_id}"}
