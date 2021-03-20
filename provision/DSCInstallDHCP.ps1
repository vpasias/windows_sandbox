Configuration xDhcpsServerScope_NewScope
{
    Import-DscResource -ModuleName xDHCpServer
#    Import-DscResource -Name xDhcpServerOption
    #Define NIC IP
    $IP = Get-NetIPAddress -InterfaceAlias "Ethernet 2" | Where-Object {$_.IPAddress -notlike "*:*" } | select -ExpandProperty IPAddress
    Node 'localhost'
    {
        WindowsFeature 'RSAT-DHCP'
        {
            Name   = 'RSAT-DHCP'
            Ensure = 'Present'
        }
        WindowsFeature 'DHCP'
        {
            Name   = 'DHCP'
            Ensure = 'Present'
        }
                
        xDhcpServerAuthorization RemoteServerActivation
        {
            Ensure = 'Present'
            DnsName = $env:COMPUTERNAME + '.vipnet.local'
            IPAddress = $IP
            IsSingleInstance = 'Yes'
        }       
                  
        
        xDhcpServerScope Scope
        {
            ScopeID = '192.168.11.0'
            Ensure = 'Present'
            IPEndRange = '192.168.11.254'
            IPStartRange = '192.168.11.10'
            Name = '11.0/24'
            SubnetMask = '255.255.255.0'
            LeaseDuration = ((New-TimeSpan -Hours 8 ).ToString())
            State = 'Active'
#            AddressFamily = 'IPv4'
        }     
        
        xDhcpServerOptionDefinition Option
        {
            OptionID = '192.168.11.0'
            VendorClass = ''
            Name = 'Option1'
            Type = 'IPv4Address'
            Ensure = 'Present'
            MultiValued = 'Yes'
            Description = 'Option1'
            AddressFamily = 'IPv4'
        }
    }
}
xDhcpsServerScope_NewScope
Start-DscConfiguration -Path .\xDhcpsServerScope_NewScope -Force -Wait -Verbose
