# Example: Targeted RAG Querying

This example demonstrates using `cta_fetch.py` to retrieve exact code context.

## Step 1: Query for Auth Symbols
```bash
cta-fetch symbol auth
```

## Step 2: Slice Targeted File
```bash
cta-fetch slice backend/auth/jwt.py 1 30
```
