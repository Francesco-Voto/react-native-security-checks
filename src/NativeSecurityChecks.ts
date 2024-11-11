import type { TurboModule } from 'react-native';
import { TurboModuleRegistry } from 'react-native';

export interface Spec extends TurboModule {
  isFridaDetected(): boolean;
}

export default TurboModuleRegistry.getEnforcing<Spec>('RNSecurityChecks');
