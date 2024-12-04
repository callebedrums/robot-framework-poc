from robot.api import logger

from SeleniumLibrary.base import LibraryComponent, keyword

networkConfigurations = {
  'Speed 1': {
    'offline': False,
    'download_throughput': ((500 * 1000) / 8) * 0.8,
    'upload_throughput': ((500 * 1000) / 8) * 0.8,
    'latency': 400 * 5,
  },
  'Speed 2': {
    'offline': False,
    'download_throughput': ((1.6 * 1000 * 1000) / 8) * 0.9,
    'upload_throughput': ((750 * 1000) / 8) * 0.9,
    'latency': 150 * 3.75,
  },
  'offline': {
    'offline': True,
    'download_throughput': 0,
    'upload_throughput': 0,
    'latency': 0,
  }
}

class SetupThrottle(LibraryComponent):

  def __init__(self, ctx):
    LibraryComponent.__init__(self, ctx)

  @keyword()
  def setup_throttle(self, speed):
    logger.info(f"Setting network to {speed}")

    if speed in networkConfigurations:
      self.driver.set_network_conditions(**networkConfigurations[speed])