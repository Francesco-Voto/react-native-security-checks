import { StyleSheet, View, Text } from 'react-native';
import { isFridaDetected } from 'react-native-security-checks';

export default function App() {
  return (
    <View style={styles.container}>
      <Text>Frida detected: {isFridaDetected() ? 'yes' : 'no'}</Text>
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
