#Performance Benchmark of an MQTT Broker (test version)
#The Publisher 
########################################
import paho.mqtt.client as mqtt
import random
import time
import tkinter as tk
import tkinter.scrolledtext as st
import threading

#---------------------------------------------------------
exitFlag = 0
class thread (threading.Thread):
   def __init__(self, threadID, name, counter):
      threading.Thread.__init__(self)
      self.threadID = threadID
      self.name = name
      self.counter = counter
   def run(self):
      print ("Starting " + self.name)
      print_time(self.name, 5, self.counter)
      benchmark (self.name)
      print ("Exiting " + self.name)

def print_time(threadName, counter, delay):
   while counter:
      if exitFlag:
         threadName.exit()
      time.sleep(delay)
      print ("%s: %s" % (threadName, time.ctime(time.time())))
      counter -= 1
#---------------------------------------------------------
def generate_message(length):
    message=""
    i=0
    while((length-i)>0):
        message+=str(random.randint(0,9))
        i+=1
    return message

#---------------------------------------------------------
def on_connect(client, userdata, flags, rc):
    print("Connection result: " + mqtt.connack_string(rc)) #rc:CONNACK received, MD:Msg id
    if rc != mqtt.CONNACK_ACCEPTED:
        client.disconnect()

#---------------------------------------------------------
def on_disconnect(client, userdata, rc):
    Txt_out.insert(tk.END,"Disconnecting"+'\n')

#---------------------------------------------------------
def on_publish(client, userdata, mid):
    Txt_out.insert(tk.END,"Published message: " + str(mid)+'\n')
    client.disconnect()

#---------------------------------------------------------
client_id = "Client-test-" + str(random.randint(0, 1000)) # generate client ID with pub prefix randomly
mqtt_client = mqtt.Client(client_id)

mqtt_client.username_pw_set("sami","0000")

mqtt_client.on_connect = on_connect
mqtt_client.on_disconnect = on_disconnect
mqtt_client.on_publish = on_publish

#IHM =====================================================
root= tk.Tk()

canvas1 = tk.Canvas(root, width = 600, height = 600,  relief = 'raised')

label1 = tk.Label(root, text='Benchmark for MQTT Broker')
label1.config(font=('helvetica', 14))
canvas1.create_window(300, 25, window=label1)
#Number of tests---------------------------------------------
label2 = tk.Label(root, text='Number of tests:')
label2.config(font=('helvetica', 10))
canvas1.create_window(300, 100, window=label2)
nb_tests = tk.Entry (root) 
canvas1.create_window(300, 120, window=nb_tests)
nb_tests.insert(0,"5")
#Number of clients---------------------------------------------
label3 = tk.Label(root, text='Number of clients:')
canvas1.create_window(300, 150, window=label3)
nb_clients = tk.Entry (root) 
canvas1.create_window(300, 170, window=nb_clients)
nb_clients.insert(0,"5")
#Number of topics---------------------------------------------
label4 = tk.Label(root, text='Number of topics:')
canvas1.create_window(300, 200, window=label4)
nb_topics = tk.Entry (root) 
canvas1.create_window(300, 220, window=nb_topics)
nb_topics.insert(0,"5")
#Size of Pyload---------------------------------------------
label5 = tk.Label(root, text='Size of payload (number of chars):')
canvas1.create_window(300, 250, window=label5)
sz_payload = tk.Entry (root) 
canvas1.create_window(300, 270, window=sz_payload)
sz_payload.insert(0,"1024")
#Quality of service (0, 1 or 2)---------------------------------------------
label6 = tk.Label(root, text='Quality of service:')
canvas1.create_window(300, 300, window=label6)
QofS = tk.Entry (root) 
canvas1.create_window(300, 320, window=QofS)
QofS.insert(0,"0")
#Broker address---------------------------------------------
label7 = tk.Label(root, text='Broker address:')
canvas1.create_window(300, 350, window=label7)
br_address = tk.Entry (root) 
canvas1.create_window(300, 370, window=br_address)
br_address.insert(0,"broker.hivemq.com")
#Broker port---------------------------------------------
label8 = tk.Label(root, text='Broker port:')
canvas1.create_window(450, 350, window=label8)
br_port = tk.Entry (root) 
canvas1.create_window(450, 370, window=br_port)
br_port.insert(0,"1883")
#Output---------------------------------------------
label9 = tk.Label(root, text='Output:')
canvas1.create_window(50, 400, window=label9)
Txt_out = st.ScrolledText(root, height = 8, width = 70)
canvas1.create_window(300, 480, window=Txt_out)
def startThreading ():
    client_nbr = int(nb_clients.get())
    a = {}
    k = 0
    while k < client_nbr:
       key = 'Thread '+str(k)
       value = thread(k,'Thread '+str(k),1)
       a[key] = value 
       a[key].start()
       k += 1
    


def benchmark (name): 
    client_nbr = int(nb_clients.get())
    payload_size = int(sz_payload.get())
    nbr_tests = int(nb_tests.get())
    qos = int(QofS.get())
    nbr_topic=int(nb_topics.get())
    broker_adr=br_address.get()
    broker_prt = int(br_port.get())

    msg = generate_message(payload_size)
    Txt_out.insert(tk.END, "topic of "+ str(payload_size) + " chars was generated." + '\n')
    Txt_out.insert(tk.END, "Publish started: "+ str(nbr_topic) + " topics, " + str(client_nbr) + " clients." '\n')
    Txt_out.insert(tk.END, "____________________________________" + '\n')

    measures = []
    Txt_out.update_idletasks()
    for i in range(nbr_tests):
        start = time.time_ns()
        mqtt_client.connect(broker_adr, broker_prt)
    
        #'''''''''''''''''''''''''''''''''''''''''''''''''''
        for j in range(0,nbr_topic):
            topic_msg = "iot_mqtt/topic" + str(j)
            info=mqtt_client.publish(topic_msg, msg, qos)
            #if info.is_published() == False:
            #print("Not published.")
            #info.wait_for_publish()
            Txt_out.update_idletasks()
        #'''''''''''''''''''''''''''''''''''''''''''''''''''
        stop = time.time_ns()
        T = stop - start
        Txt_out.insert(tk.END, "Completed in " + str(T) + " ns." + '\n')
        measures.append(T)
        time.sleep(1) # time to end callback 1s
        #mqtt_client.loop_forever()

        Txt_out.update_idletasks()

    Txt_out.insert(tk.END,"-------------------------------------------------------"+'\n')
    avrg = sum(measures)/nbr_tests
    Txt_out.insert(tk.END,"Latency average = "+ str(avrg)+ " ns"+" of "+name+'\n')
    Txt_out.insert(tk.END,"-------------------------------------------------------"+'\n')

    Txt_out.see(tk.END)
    Txt_out.update_idletasks()

#Button---------------------------------------------    
button1 = tk.Button(text='Start', command=startThreading, bg='brown', fg='white', font=('helvetica', 9, 'bold'))
canvas1.create_window(50, 25, window=button1)

canvas1.pack()
canvas1.update_idletasks()

root.mainloop()