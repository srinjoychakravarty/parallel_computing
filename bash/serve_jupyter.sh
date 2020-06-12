jupyter-notebook &
echo Loading Jupter Notebook in 10 seconds...
sleep 10
b=`getip | awk '{print $2}'`
echo -e "\n\n\n"
echo "Notebook URLs are"
jupyter-notebook list | awk 'NR>1{print $1}' | sed 's/0.0.0.0/'$b'/g'
