local app_temp = {
 "accounts": "spinnaker",
 "cloudProviders": "kubernetes",
 "email": error "email required!",
 "instancePort": 8080,
 "lastModifiedBy": "admin",
 "name": "demo-1",
 "trafficGuards": [],
 "user": "admin"
};

local arr = std.range(1,3);

[ 
  app_temp + {name: "demo-%d" % x, email: "contact@wurbanski.me" }
    for x in arr
]
