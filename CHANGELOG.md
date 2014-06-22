## 0.6.0
  * Upgrade to Jenkins 1.568
  * Modify container to run Jenkins under CMD instead of ENTRYPOINT to
    make restarting Jenkins in container work
## 0.5.0 
  * Upgrade to Jenkins 1.565
  * Add Git support
## 0.4.0
  * Upgrade to Jenkins 1.551
  * Simplify exposed volume to /jenkins
  * Revert to running jenkins as root

## 0.3.1
  * Upgrade to Jenkins 1.546
  * Fix permissions when running the container
  * Decrease build size of layers

## 0.3.0

  * Fix Jenkins and Ubuntu versions (c/o @bfirsh)
  * Separate volume for data (c/o @bfirsh)
  * Update to Jenkins 1.545

## 0.2.0

  * Transition to the ubuntu image (c/o @jplock)
  * Update to Jenkins 1.527

## 0.1.0

Initial release
  * Jenkins 1.522
