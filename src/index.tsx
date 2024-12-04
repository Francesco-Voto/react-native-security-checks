const SecurityChecks = require('./NativeSecurityChecks').default;

export function isFridaDetected(): boolean {
  return SecurityChecks.isFridaDetected();
}
