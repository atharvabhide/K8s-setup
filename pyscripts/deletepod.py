from kubernetes import client, config

config.load_kube_config()

v1 = client.CoreV1Api()

v1.delete_namespaced_pod(namespace='default', name='busy-pod')