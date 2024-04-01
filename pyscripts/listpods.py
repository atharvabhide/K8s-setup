from kubernetes import client, config

config.load_kube_config()

v1 = client.CoreV1Api()
response= v1.list_pod_for_all_namespaces()

for pod in response.items:
    # print(pod)
    print(" => POD " + str(pod.metadata.generate_name)  + " is " + str(pod.status.phase) + " on Node " + str(pod.spec.node_name))