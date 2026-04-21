# DEIMv2 Docker Tooling

---

## Working with the container

- Building the container:

```bash
docker build -t deim-tooling:<tag> . # Add --progress=plain for debugging
```

- Running the container in **interactive** mode:

```bash
docker run -it --rm \
        -v ./configs:/app/configs \
        -v ./models:/app/models \
        -v ./outputs:/app/outputs \
        deim-tooling:<tag>
```

- Running the container one shot, best for exporting models:

```bash
docker run --rm \
        -v ./configs:/app/configs \
        -v ./models:/app/models \
        -v ./outputs:/app/outputs \
        deim-tooling:<tag> <command> <arguments>
```

## Supported commands

| Command        | Arguments                                      | File                                 | Description                                                   |
|----------------|------------------------------------------------|--------------------------------------|---------------------------------------------------------------|
| export_onnx    | **-c/--config<br>-r/--resume**<br>--check<br>--simplify | tools/deployment/export_onnx_norm.py | Export model in ONNX format, with output boxes are normalized |
| inference_onnx | **--onnx<br>--input**                             | tools/inference/onnx_inf.py          | Run inference on ONNX model                                   |

