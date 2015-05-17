<?xml version="1.0" encoding="utf-8"?>
<serviceModel xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" name="RedisSessionStateWebRole" generation="1" functional="0" release="0" Id="13df7369-9094-4513-898a-1f64ab9d841e" dslVersion="1.2.0.0" xmlns="http://schemas.microsoft.com/dsltools/RDSM">
  <groups>
    <group name="RedisSessionStateWebRoleGroup" generation="1" functional="0" release="0">
      <componentports>
        <inPort name="MyWebApp:Endpoint1" protocol="http">
          <inToChannel>
            <lBChannelMoniker name="/RedisSessionStateWebRole/RedisSessionStateWebRoleGroup/LB:MyWebApp:Endpoint1" />
          </inToChannel>
        </inPort>
      </componentports>
      <settings>
        <aCS name="MyWebAppInstances" defaultValue="[1,1,1]">
          <maps>
            <mapMoniker name="/RedisSessionStateWebRole/RedisSessionStateWebRoleGroup/MapMyWebAppInstances" />
          </maps>
        </aCS>
      </settings>
      <channels>
        <lBChannel name="LB:MyWebApp:Endpoint1">
          <toPorts>
            <inPortMoniker name="/RedisSessionStateWebRole/RedisSessionStateWebRoleGroup/MyWebApp/Endpoint1" />
          </toPorts>
        </lBChannel>
      </channels>
      <maps>
        <map name="MapMyWebAppInstances" kind="Identity">
          <setting>
            <sCSPolicyIDMoniker name="/RedisSessionStateWebRole/RedisSessionStateWebRoleGroup/MyWebAppInstances" />
          </setting>
        </map>
      </maps>
      <components>
        <groupHascomponents>
          <role name="MyWebApp" generation="1" functional="0" release="0" software="C:\dev\RedisSessionStateExample\RedisSessionStateWebRole\csx\Debug\roles\MyWebApp" entryPoint="base\x64\WaHostBootstrapper.exe" parameters="base\x64\WaIISHost.exe " memIndex="-1" hostingEnvironment="frontendadmin" hostingEnvironmentVersion="2">
            <componentports>
              <inPort name="Endpoint1" protocol="http" portRanges="80" />
            </componentports>
            <settings>
              <aCS name="__ModelData" defaultValue="&lt;m role=&quot;MyWebApp&quot; xmlns=&quot;urn:azure:m:v1&quot;&gt;&lt;r name=&quot;MyWebApp&quot;&gt;&lt;e name=&quot;Endpoint1&quot; /&gt;&lt;/r&gt;&lt;/m&gt;" />
            </settings>
            <resourcereferences>
              <resourceReference name="DiagnosticStore" defaultAmount="[4096,4096,4096]" defaultSticky="true" kind="Directory" />
              <resourceReference name="EventStore" defaultAmount="[1000,1000,1000]" defaultSticky="false" kind="LogStore" />
            </resourcereferences>
          </role>
          <sCSPolicy>
            <sCSPolicyIDMoniker name="/RedisSessionStateWebRole/RedisSessionStateWebRoleGroup/MyWebAppInstances" />
            <sCSPolicyUpdateDomainMoniker name="/RedisSessionStateWebRole/RedisSessionStateWebRoleGroup/MyWebAppUpgradeDomains" />
            <sCSPolicyFaultDomainMoniker name="/RedisSessionStateWebRole/RedisSessionStateWebRoleGroup/MyWebAppFaultDomains" />
          </sCSPolicy>
        </groupHascomponents>
      </components>
      <sCSPolicy>
        <sCSPolicyUpdateDomain name="MyWebAppUpgradeDomains" defaultPolicy="[5,5,5]" />
        <sCSPolicyFaultDomain name="MyWebAppFaultDomains" defaultPolicy="[2,2,2]" />
        <sCSPolicyID name="MyWebAppInstances" defaultPolicy="[1,1,1]" />
      </sCSPolicy>
    </group>
  </groups>
  <implements>
    <implementation Id="c5086970-144c-4709-8146-a5c70749a530" ref="Microsoft.RedDog.Contract\ServiceContract\RedisSessionStateWebRoleContract@ServiceDefinition">
      <interfacereferences>
        <interfaceReference Id="047dd770-fa17-458a-bc82-d59e11ff3d56" ref="Microsoft.RedDog.Contract\Interface\MyWebApp:Endpoint1@ServiceDefinition">
          <inPort>
            <inPortMoniker name="/RedisSessionStateWebRole/RedisSessionStateWebRoleGroup/MyWebApp:Endpoint1" />
          </inPort>
        </interfaceReference>
      </interfacereferences>
    </implementation>
  </implements>
</serviceModel>