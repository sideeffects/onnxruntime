include(FetchContent)


if (Patch_FOUND)
    set(CUDNN_FRONTEND_PATCH_COMMAND ${Patch_EXECUTABLE} -p1 < ${PROJECT_SOURCE_DIR}/patches/cudnn_frontend/cudnn_frontend.patch)
else ()
    set(CUDNN_FRONTEND_PATCH_COMMAND "")
endif ()

FetchContent_Declare(
  cudnn_frontend
  URL ${DEP_URL_cudnn_frontend}
  URL_HASH SHA1=${DEP_SHA1_cudnn_frontend}
  PATCH_COMMAND ${CUDNN_FRONTEND_PATCH_COMMAND}
)

set(CUDNN_FRONTEND_BUILD_SAMPLES OFF)
set(CUDNN_FRONTEND_BUILD_UNIT_TESTS OFF)
set(CUDNN_FRONTEND_BUILD_PYTHON_BINDINGS OFF)
set(CUDNN_FRONTEND_SKIP_JSON_LIB ON)
set(CUDNN_PATH ${onnxruntime_CUDNN_HOME})
FetchContent_MakeAvailable(cudnn_frontend)
