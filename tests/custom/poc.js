const networkConfigurations = {
  "Speed 1": {
    offline: false,
    downloadThroughput: ((500 * 1000) / 8) * 0.8,
    uploadThroughput: ((500 * 1000) / 8) * 0.8,
    latency: 400 * 5,
  },
  "Speed 2": {
    offline: false,
    downloadThroughput: ((1.6 * 1000 * 1000) / 8) * 0.9,
    uploadThroughput: ((750 * 1000) / 8) * 0.9,
    latency: 150 * 3.75,
  },
  Offline: {
    offline: true,
  },
};

/**
 * setupThrottle get current playwright context and set
 * the network emulation conditions with different speeds.
 * See above for possible configurations.
 */
async function setupThrottle(config, page, logger) {
  if (networkConfigurations[config]) {
    const context = page.context();
    const cdpSession = await context.newCDPSession(page);
    await cdpSession.send(
      "Network.emulateNetworkConditions",
      networkConfigurations[config]
    );
  }
  logger(`Setup Throttle, ${config}`);
}

exports.__esModule = true;
exports.setupThrottle = setupThrottle;
