stages:
  - build
  - test
  - deploy

# Build image
build:
  stage: build
  script:
    - docker build -t myapp:$CI_COMMIT_SHA .
    - docker images

# Test job
test:
  stage: test
  script:
    - docker run myapp:$CI_COMMIT_SHA npm run test

# Deploy to production
deploy:
  stage: deploy
  script:
    - docker push myapp:$CI_COMMIT_SHA
    - echo "Deployed to production"
  only:
    - main
