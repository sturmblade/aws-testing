#!/bin/bash

echo "🧪 Testing OIDC Authentication Workflow"
echo "======================================"

# Trigger the workflow
echo "1. Triggering test-oidc workflow..."
gh workflow run test-oidc.yml --ref main

# Wait a moment for the run to start
echo "2. Waiting for workflow to start..."
sleep 10

# Get the latest run
echo "3. Getting latest run details..."
RUN_ID=$(gh run list --workflow=test-oidc.yml --limit 1 --json databaseId --jq '.[0].databaseId')
echo "   Run ID: $RUN_ID"

# Monitor the run
echo "4. Monitoring workflow execution..."
gh run watch $RUN_ID

# Show final results
echo "5. Final results:"
gh run view $RUN_ID --log

echo ""
echo "✅ OIDC test completed!"
echo "🔍 Check the logs above for OIDC authentication verification"
