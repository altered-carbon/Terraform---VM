#Consul Configuration

server = true
ui = true
bootstrap_expect = 1
datacenter = "server1"
data_dir = "./data"

# ACL Configuration

acl = {
    default_policy = "deny"
    enabled = true
    enable_token_persistence = true
}