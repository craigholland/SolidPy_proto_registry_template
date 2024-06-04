poetry config http-basic.pypi-gcp oauth2accesstoken $(gcloud auth print-access-token)

poetry publish --build --repository pypi-gcp