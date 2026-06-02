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

- For training:

```bash
docker run --rm \
        --ipc=host \
        --gpus all \
        -v ./configs:/app/configs \
        -v ./data:/app/data \
        -v ./models:/app/models \
        -v ./outputs:/app/outputs \
        -v ./logs:/app/logs \
        deim-tooling:<tag> train path/to/config_file.txt
```

## Supported commands

| Command        | Arguments                                      | File                                 | Description                                                   |
|----------------|------------------------------------------------|--------------------------------------|---------------------------------------------------------------|
| export_onnx    | **-c/--config<br>-r/--resume**<br>--check<br>--simplify | tools/deployment/export_onnx_norm.py | Export model in ONNX format, with output boxes are normalized |
| inference_onnx | **--onnx<br>--input**                             | tools/inference/onnx_inf.py          | Run inference on ONNX model                                   |
| convert_onnx2tf | **-i** | - | Convert ONNX model to TFLITE format |
| train          | **<config_file>**                            | -                                      | Run multiple training with config stored in a text file      |

>[!ATTENTION]
> Arguments in **bold** are required ones.
>
> To get a full list of available arguments for each command, try use them with -h or --help.

>[!NOTE]
> For train command, the text file is expected to have **each configuration in one line**, with the format as below:
>
> path/to/training_config.yml path/to/checkpoint_model.pth log_file_name seed
>
> Where each argument is separated by space(s). Seed can be omitted.


