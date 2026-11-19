# ${{ values.component_id }}

${{ values.description }}

## Overview

Angular 20 website with a multi-stage container build (Node → nginx on port 8080), Tekton CI, and Argo CD GitOps.

## Deployments

- **digs**: Push commits to a branch other than `main` to build the image and deploy to the `${{ values.component_id }}-dev` namespace (`:latest`).
- **prod**: Push or merge to `main` to promote digs to prod (retag `:latest` → `:prod`) and update the Argo CD prod application in `${{ values.component_id }}-prod`.

## Local development

```bash
npm install
npm start
```

The app is served at http://localhost:4200.

## OpenShift Dev Spaces

Open this repository from Developer Hub with the **OpenShift Dev Spaces (VS Code)** link. The included Devfile provides:

1. **Install dependencies** — `npm install`
2. **Start Development mode** — `ng serve` on port 4200
