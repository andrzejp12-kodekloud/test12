network_config = {
  vnet1 = {
    vnet = {
      name          = "vnet-sandbox-transit"
      address_space = ["10.135.225.0/26", "10.135.225.64/27"]
    }
    subnets = {
      priv = {
        name                    = "subnet-priv"
        address_prefixes        = ["10.135.225.64/27"]
        delegation_name         = "databricks"
        service_delegation_name = "Microsoft.Databricks/workspaces"
        service_delegation_actions = [
          "Microsoft.Network/virtualNetworks/subnets/join/action",
          "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action",
          "Microsoft.Network/virtualNetworks/subnets/unprepareNetworkPolicies/action"
        ]
        private_endpoint_network_policies = "Enabled"
      }
      pub = {
        name                    = "subnet-pub"
        address_prefixes        = ["10.135.225.32/27"]
        delegation_name         = "databricks"
        service_delegation_name = "Microsoft.Databricks/workspaces"
        service_delegation_actions = [
          "Microsoft.Network/virtualNetworks/subnets/join/action",
          "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action",
          "Microsoft.Network/virtualNetworks/subnets/unprepareNetworkPolicies/action"
        ]
        private_endpoint_network_policies = "Enabled"
      }
      transit = {
        name                              = "subnet-transit"
        address_prefixes                  = ["10.135.225.0/27"]
        private_endpoint_network_policies = "Enabled"
      }
    }
  }
}
