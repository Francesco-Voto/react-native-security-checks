const SecurityChecks = require('./NativeSecurityChecks').default;

export function isFridaDetected(): boolean {
  return SecurityChecks.isFridaDetected();
}

export function isSignatureCompromised(originalSignature: string): boolean {
  return !SecurityChecks.isSignatureValid(originalSignature);
}
