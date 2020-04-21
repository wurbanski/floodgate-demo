local pipeline_tmp = {
 "application": "demo-1",
 "expectedArtifacts": [
  {
   "defaultArtifact": {
    "artifactAccount": "docker-registry",
    "id": "96b607dc-946c-4819-baa5-3b446042e7f7",
    "name": "index.docker.io/wurbanski/spinnaker-demo",
    "reference": "index.docker.io/wurbanski/spinnaker-demo:latest",
    "type": "docker/image",
    "version": "latest"
   },
   "displayName": "spinnaker-demo-docker",
   "id": "9f4bdbe2-8e37-4c81-8231-de1f22787f22",
   "matchArtifact": {
    "artifactAccount": "docker-registry",
    "id": "47fb1f03-ca4f-469d-833d-9194496d3117",
    "name": "index.docker.io/wurbanski/spinnaker-demo",
    "type": "docker/image"
   },
   "useDefaultArtifact": true,
   "usePriorArtifact": false
  }
 ],
 "id": "deploy-spinnaker-demo-1",
 "keepWaitingPipelines": false,
 "lastModifiedBy": "admin",
 "limitConcurrent": true,
 "name": "Deploy spinnaker-demo-1",
 "spelEvaluator": "v4",
 "stages": [
  {
   "account": "spinnaker",
   "cloudProvider": "kubernetes",
   "manifests": [
    {
     "apiVersion": "apps/v1",
     "kind": "Deployment",
     "metadata": {
      "name": "spinnaker-demo-1"
     },
     "spec": {
      "replicas": 2,
      "selector": {
       "matchLabels": {
        "app": "spinnaker-demo-1"
       }
      },
      "template": {
       "metadata": {
        "labels": {
         "app": "spinnaker-demo-1"
        }
       },
       "spec": {
        "containers": [
         {
          "image": "index.docker.io/wurbanski/spinnaker-demo",
          "name": "spinnaker-demo",
          "ports": [
           {
            "containerPort": 80
           }
          ]
         }
        ]
       }
      }
     }
    }
   ],
   "moniker": {
    "app": "demo-1"
   },
   "name": "Deploy application",
   "refId": "1",
   "requiredArtifactIds": [
    "9f4bdbe2-8e37-4c81-8231-de1f22787f22"
   ],
   "requiredArtifacts": [],
   "requisiteStageRefIds": [],
   "skipExpressionEvaluation": false,
   "source": "text",
   "trafficManagement": {
    "enabled": false,
    "options": {
     "enableTraffic": false,
     "services": []
    }
   },
   "type": "deployManifest"
  },
  {
   "account": "spinnaker",
   "cloudProvider": "kubernetes",
   "manifests": [
    {
     "apiVersion": "v1",
     "kind": "Service",
     "metadata": {
      "name": "spinnaker-demo-1"
     },
     "spec": {
      "ports": [
       {
        "port": 8080,
        "protocol": "TCP",
        "targetPort": 80
       }
      ],
      "selector": {
       "app": "spinnaker-demo-1"
      },
      "type": "LoadBalancer"
     }
    }
   ],
   "moniker": {
    "app": "demo-1"
   },
   "name": "Deploy service",
   "refId": "2",
   "requisiteStageRefIds": [],
   "skipExpressionEvaluation": false,
   "source": "text",
   "trafficManagement": {
    "enabled": false,
    "options": {
     "enableTraffic": false,
     "services": []
    }
   },
   "type": "deployManifest"
  }
 ],
 "triggers": [
  {
   "account": "my-docker-registry",
   "enabled": true,
   "expectedArtifactIds": [
    "9f4bdbe2-8e37-4c81-8231-de1f22787f22"
   ],
   "organization": "wurbanski",
   "registry": "index.docker.io",
   "repository": "wurbanski/spinnaker-demo",
   "type": "docker"
  }
 ]
};

pipeline_tmp
