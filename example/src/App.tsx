import { StyleSheet, View, Text } from 'react-native';
import {
  isFridaDetected,
  isSignatureCompromised,
} from 'react-native-security-checks';

const SIGNATURE =
  'fac61745dc0903786fb9ede62a962b399f7348f0bb6f899b8332667591033b9c';

export default function App() {
  return (
    <View style={styles.container}>
      <Text>Frida detected: {isFridaDetected() ? 'yes' : 'no'}</Text>

      <Text>
        Signature comrpomised:{' '}
        {isSignatureCompromised(SIGNATURE) ? 'yes' : 'no'}
      </Text>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
  },
  box: {
    width: 60,
    height: 60,
    marginVertical: 20,
  },
});
