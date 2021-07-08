package appshield.kubernetes.KSV022

test_denied {
	r := deny with input as {
		"apiVersion": "v1",
		"kind": "Pod",
		"metadata": {"name": "hello-add-capabilities"},
		"spec": {"containers": [{
			"command": [
				"sh",
				"-c",
				"echo 'Hello' && sleep 1h",
			],
			"image": "busybox",
			"name": "hello",
			"securityContext": {"capabilities": {"add": ["NET_BIND_SERVICE"]}},
		}]},
	}

	count(r) == 1
	r[_].msg == "container hello of pod hello-add-capabilities in default namespace should not set securityContext.capabilities.add"
}

test_empty_add_allowed {
	r := deny with input as {
		"apiVersion": "v1",
		"kind": "Pod",
		"metadata": {"name": "hello-add-capabilities"},
		"spec": {"containers": [{
			"command": [
				"sh",
				"-c",
				"echo 'Hello' && sleep 1h",
			],
			"image": "busybox",
			"name": "hello",
			"securityContext": {"capabilities": {"add": []}},
		}]},
	}

	count(r) == 0
}

test_no_add_allowed {
	r := deny with input as {
		"apiVersion": "v1",
		"kind": "Pod",
		"metadata": {"name": "hello-add-capabilities"},
		"spec": {"containers": [{
			"command": [
				"sh",
				"-c",
				"echo 'Hello' && sleep 1h",
			],
			"image": "busybox",
			"name": "hello",
			"securityContext": {"capabilities": {}},
		}]},
	}

	count(r) == 0
}

test_no_capabilities_allowed {
	r := deny with input as {
		"apiVersion": "v1",
		"kind": "Pod",
		"metadata": {"name": "hello-add-capabilities"},
		"spec": {"containers": [{
			"command": [
				"sh",
				"-c",
				"echo 'Hello' && sleep 1h",
			],
			"image": "busybox",
			"name": "hello",
			"securityContext": {},
		}]},
	}

	count(r) == 0
}
