FROM python:3.14-slim

WORKDIR /workspace
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    gfortran \
    && rm -rf /var/lib/apt/lists/*  # Delete the cached apt files for smaller image size.
RUN pip install --no-cache-dir nena_component_tools cmake
COPY *.py .
COPY *.f90 .
COPY CMakeLists.txt .
RUN cmake -S . -B build -DCMAKE_BUILD_TYPE=RelWithDebInfo
RUN cmake --build build --config RelWithDebInfo

CMD ["python", "./container_loop.py"]
