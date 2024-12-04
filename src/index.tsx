const SecurityChecks = require('./NativeSecurityChecks').default;

export function multiply(a: number, b: number): number {
  return SecurityChecks.multiply(a, b);
}
