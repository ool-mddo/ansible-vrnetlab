cat generate_config_RegionA.yml | sed  -e 's/RegionB/RegionC/g' -e 's/RegionA/RegionB/g' -e 's/RegionJ/RegionA/g' -e 's/65001/65002/g' -e 's/65000/65001/g' -e 's/65009/65000/g' -e 's/1\.1\.1\.1/2.2.2.2/g' -e 's/1\.1\.1\.2/2.2.2.3/g' -e 's/1\.1\.1\.3/2.2.2.4/g'  -e 's/1\.1\.1\.4/2.2.2.5/g' -e 's/172\.16/172.17/g'  -e 's/172\.30/172.31/g' -e 's/fc00:1:1:1::1/fc00:2:2:2::2/g' -e 's/fc00:1:1:1::2/fc00:2:2:2::3/g' -e 's/fc00:172:16/fc00:172:17/g'  -e 's/fc00:172:30/fc00:172:31/g' -e 's/10\.1\.0\./10.1.1./g' -e 's/10\.1\.1\./10.1.2./g' -e 's/fc00:10:1::/fc00:10:1:1::/g' -e 's/fc00:10:1:1:/fc00:10:1:2/g' > generate_config_RegionB.yml

cat generate_config_RegionA.yml | sed -e 's/RegionA/RegionC/g' -e 's/RegionJ/RegionB/g' -e 's/RegionB/RegionD/g' -e 's/65000/65002/g' -e 's/65009/65001/g' -e 's/65001/65003/g' -e 's/1\.1\.1\.1/3.3.3.3/g' -e 's/1\.1\.1\.2/3.3.3.4/g' -e 's/1\.1\.1\.3/3.3.3.5/g'  -e 's/1\.1\.1\.4/3.3.3.6/g' -e 's/172\.16/172.18/g'  -e 's/172\.30/172.32/g' -e 's/fc00:1:1:1::1/fc00:3:3:3::3/g' -e 's/fc00:1:1:1::2/fc00:3:3:3::4/g' -e 's/fc00:172:16/fc00:172:18/g'  -e 's/fc00:172:30/fc00:172:32/g' -e 's/10\.1\.0\./10.1.2./g' -e 's/10\.1\.1\./10.1.3./g' -e 's/fc00:10:1::/fc00:10:1:2::/g' -e 's/fc00:10:1:1:/fc00:10:1:3/g' > generate_config_RegionC.yml

cat generate_config_RegionA.yml | sed -e 's/RegionA/RegionD/g' -e 's/RegionJ/RegionC/g' -e 's/RegionB/RegionE/g' -e 's/65000/65003/g' -e 's/65009/65002/g' -e 's/65001/65004/g' -e 's/1\.1\.1\.1/4.4.4.4/g' -e 's/1\.1\.1\.2/4.4.4.5/g' -e 's/1\.1\.1\.3/4.4.4.6/g'  -e 's/1\.1\.1\.4/4.4.4.7/g' -e 's/172\.16/172.19/g'  -e 's/172\.30/172.33/g' -e 's/fc00:1:1:1::1/fc00:4:4:4::4/g' -e 's/fc00:1:1:1::2/fc00:4:4:4::5/g' -e 's/fc00:172:16/fc00:172:19/g'  -e 's/fc00:172:30/fc00:172:33/g' -e 's/10\.1\.0\./10.1.3./g' -e 's/10\.1\.1\./10.1.4./g' -e 's/fc00:10:1::/fc00:10:1:3::/g' -e 's/fc00:10:1:1:/fc00:10:1:4/g' > generate_config_RegionD.yml

cat generate_config_RegionA.yml | sed -e 's/RegionA/RegionE/g' -e 's/RegionJ/RegionD/g' -e 's/RegionB/RegionF/g' -e 's/65000/65004/g' -e 's/65009/65003/g' -e 's/65001/65005/g' -e 's/1\.1\.1\.1/5.5.5.5/g' -e 's/1\.1\.1\.2/5.5.5.6/g' -e 's/1\.1\.1\.3/5.5.5.7/g'  -e 's/1\.1\.1\.4/5.5.5.8/g' -e 's/172\.16/172.20/g'  -e 's/172\.30/172.34/g' -e 's/fc00:1:1:1::1/fc00:5:5:5::5/g' -e 's/fc00:1:1:1::2/fc00:5:5:5::6/g' -e 's/fc00:172:16/fc00:172:20/g'  -e 's/fc00:172:30/fc00:172:34/g' -e 's/10\.1\.0\./10.1.4./g' -e 's/10\.1\.1\./10.1.5./g' -e 's/fc00:10:1::/fc00:10:1:4::/g' -e 's/fc00:10:1:1:/fc00:10:1:5/g' > generate_config_RegionE.yml

cat generate_config_RegionA.yml | sed -e 's/RegionA/RegionF/g' -e 's/RegionJ/RegionE/g' -e 's/RegionB/RegionG/g' -e 's/65000/65005/g' -e 's/65009/65004/g' -e 's/65001/65006/g' -e 's/1\.1\.1\.1/6.6.6.6/g' -e 's/1\.1\.1\.2/6.6.6.7/g' -e 's/1\.1\.1\.3/6.6.6.8/g'  -e 's/1\.1\.1\.4/6.6.6.9/g' -e 's/172\.16/172.21/g'  -e 's/172\.30/172.35/g' -e 's/fc00:1:1:1::1/fc00:6:6:6::6/g' -e 's/fc00:1:1:1::2/fc00:6:6:6::7/g' -e 's/fc00:172:16/fc00:172:21/g'  -e 's/fc00:172:30/fc00:172:35/g' -e 's/10\.1\.0\./10.1.5./g' -e 's/10\.1\.1\./10.1.6./g' -e 's/fc00:10:1::/fc00:10:1:5::/g' -e 's/fc00:10:1:1:/fc00:10:1:6/g' > generate_config_RegionF.yml

cat generate_config_RegionA.yml | sed -e 's/RegionA/RegionG/g' -e 's/RegionJ/RegionF/g' -e 's/RegionB/RegionH/g' -e 's/65000/65006/g' -e 's/65009/65005/g' -e 's/65001/65007/g' -e 's/1\.1\.1\.1/7.7.7.7/g' -e 's/1\.1\.1\.2/7.7.7.8/g' -e 's/1\.1\.1\.3/7.7.7.9/g'  -e 's/1\.1\.1\.4/7.7.7.10/g' -e 's/172\.16/172.22/g'  -e 's/172\.30/172.36/g' -e 's/fc00:1:1:1::1/fc00:7:7:7::7/g' -e 's/fc00:1:1:1::2/fc00:7:7:7::8/g' -e 's/fc00:172:16/fc00:172:22/g'  -e 's/fc00:172:30/fc00:172:36/g' -e 's/10\.1\.0\./10.1.6./g' -e 's/10\.1\.1\./10.1.7./g' -e 's/fc00:10:1::/fc00:10:1:6::/g' -e 's/fc00:10:1:1:/fc00:10:1:7/g' > generate_config_RegionG.yml

cat generate_config_RegionA.yml | sed -e 's/RegionA/RegionH/g' -e 's/RegionJ/RegionG/g' -e 's/RegionB/RegionI/g' -e 's/65000/65007/g' -e 's/65009/65006/g' -e 's/65001/65008/g' -e 's/1\.1\.1\.1/8.8.8.8/g' -e 's/1\.1\.1\.2/8.8.8.9/g' -e 's/1\.1\.1\.3/8.8.8.10/g'  -e 's/1\.1\.1\.4/8.8.8.11/g' -e 's/172\.16/172.23/g'  -e 's/172\.30/172.37/g' -e 's/fc00:1:1:1::1/fc00:8:8:8::8/g' -e 's/fc00:1:1:1::2/fc00:8:8:8::9/g' -e 's/fc00:172:16/fc00:172:23/g'  -e 's/fc00:172:30/fc00:172:37/g' -e 's/10\.1\.0\./10.1.7./g' -e 's/10\.1\.1\./10.1.8./g' -e 's/fc00:10:1::/fc00:10:1:7::/g' -e 's/fc00:10:1:1:/fc00:10:1:8/g' > generate_config_RegionH.yml

cat generate_config_RegionA.yml | sed -e 's/RegionA/RegionI/g' -e 's/RegionJ/RegionH/g' -e 's/RegionB/RegionJ/g' -e 's/65000/65008/g' -e 's/65009/65007/g' -e 's/65001/65009/g' -e 's/1\.1\.1\.1/9.9.9.9/g' -e 's/1\.1\.1\.2/9.9.9.10/g' -e 's/1\.1\.1\.3/9.9.9.11/g'  -e 's/1\.1\.1\.4/9.9.9.12/g' -e 's/172\.16/172.24/g'  -e 's/172\.30/172.38/g' -e 's/fc00:1:1:1::1/fc00:9:9:9::9/g' -e 's/fc00:1:1:1::2/fc00:9:9:9::10/g' -e 's/fc00:172:16/fc00:172:24/g'  -e 's/fc00:172:30/fc00:172:38/g' -e 's/10\.1\.0\./10.1.8./g' -e 's/10\.1\.1\./10.1.9./g' -e 's/fc00:10:1::/fc00:10:1:8::/g' -e 's/fc00:10:1:1:/fc00:10:1:9/g' > generate_config_RegionI.yml

cat generate_config_RegionA.yml | sed -e 's/RegionA/RegionJ/g' -e 's/RegionJ/RegionI/g' -e 's/RegionB/RegionK/g' -e 's/65000/65009/g' -e 's/65009/65008/g' -e 's/65001/65010/g' -e 's/1\.1\.1\.1/10.10.10.10/g' -e 's/1\.1\.1\.2/10.10.10.11/g' -e 's/1\.1\.1\.3/10.10.10.12/g'  -e 's/1\.1\.1\.4/10.10.10.13/g' -e 's/172\.16/172.25/g'  -e 's/172\.30/172.39/g' -e 's/fc00:1:1:1::1/fc00:10:10:10::10/g' -e 's/fc00:1:1:1::2/fc00:10:10:10::11/g' -e 's/fc00:172:16/fc00:172:25/g'  -e 's/fc00:172:30/fc00:172:39/g' -e 's/10\.1\.0\./10.1.9./g' -e 's/10\.1\.1\./10.1.10./g' -e 's/fc00:10:1::/fc00:10:1:9::/g' -e 's/fc00:10:1:1:/fc00:10:1:1:0/g' > generate_config_RegionJ.yml

