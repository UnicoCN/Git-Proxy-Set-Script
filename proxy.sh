ip_=$(cat /etc/resolv.conf)
len=${#ip_}
len=$((len-1))
dns=""
for ((i=$len;i>=0;i--))
do
	if [[ ${ip_:$i:1} != " " ]]; then
		dns=${dns}${ip_:$i:1}
	else
		break
	fi
done
dns=`echo $dns | rev`
git config --global https.proxy ${dns}:7890
