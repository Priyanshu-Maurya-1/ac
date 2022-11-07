# ac
ac

1:


import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.LinkedList;
import java.util.List;
import org.cloudbus.cloudsim.Cloudlet;
import org.cloudbus.cloudsim.CloudletSchedulerTimeShared;
import org.cloudbus.cloudsim.Datacenter;
import org.cloudbus.cloudsim.DatacenterBroker;
import org.cloudbus.cloudsim.DatacenterCharacteristics;
import org.cloudbus.cloudsim.Host;
import org.cloudbus.cloudsim.Log;
import org.cloudbus.cloudsim.Pe;
import org.cloudbus.cloudsim.Storage;
import org.cloudbus.cloudsim.UtilizationModel;
import org.cloudbus.cloudsim.UtilizationModelFull;
import org.cloudbus.cloudsim.Vm;
import org.cloudbus.cloudsim.VmAllocationPolicySimple;
import org.cloudbus.cloudsim.VmSchedulerTimeShared;
import org.cloudbus.cloudsim.core.CloudSim;
import org.cloudbus.cloudsim.provisioners.BwProvisionerSimple;
import org.cloudbus.cloudsim.provisioners.PeProvisionerSimple;

import org.cloudbus.cloudsim.provisioners.RamProvisionerSimple;
public class first {
/**
* @param args the command line arguments
*/
private static List<Cloudlet> cloudletList;
private static List<Vm> vmlist;
public static void main(String[] args)
{
Log.printLine("Starting Cloudsim ...");
try
{
int num_user = 1;
Calendar calendar = Calendar.getInstance();
boolean trace_flag = false;
CloudSim.init(num_user, calendar, trace_flag);
Datacenter datacenter0 = createDatacenter("Datacenter_0");
DatacenterBroker broker = createBroker("Broker");
int brokerId = broker.getId();
vmlist = new ArrayList<Vm>();
int vmid = 0;
int mips = 1000;
long size = 10000;
int ram = 512;
long bw = 1000;
int pesNumber = 1;
String vmm = "Xen";
Vm vm = new Vm(vmid, brokerId, mips, pesNumber, ram, bw, size, vmm, new
CloudletSchedulerTimeShared());
vmlist.add(vm);
broker.submitVmList(vmlist);
cloudletList = new ArrayList<Cloudlet>();

int id = 0;
long length = 400000;
long fileSize = 300;
long outputSize = 300;
UtilizationModel utilizationModel = new UtilizationModelFull();
Cloudlet cloudlet0 = new Cloudlet(id++, length, pesNumber, fileSize, outputSize,
utilizationModel, utilizationModel, utilizationModel);
cloudlet0.setUserId(brokerId);
cloudlet0.setVmId(vmid);
cloudletList.add(cloudlet0);
Cloudlet cloudlet1 = new Cloudlet(id++, length, pesNumber, fileSize, outputSize,
utilizationModel, utilizationModel, utilizationModel);
cloudlet1.setUserId(brokerId);
cloudlet1.setVmId(vmid);
cloudletList.add(cloudlet1);
Cloudlet cloudlet2 = new Cloudlet(id++, length, pesNumber, fileSize, outputSize,
utilizationModel, utilizationModel, utilizationModel);
cloudlet2.setUserId(brokerId);
cloudlet2.setVmId(vmid);
cloudletList.add(cloudlet2);
Cloudlet cloudlet3 = new Cloudlet(id++, length, pesNumber, fileSize, outputSize,
utilizationModel, utilizationModel, utilizationModel);
cloudlet3.setUserId(brokerId);
cloudlet3.setVmId(vmid);
cloudletList.add(cloudlet3);
broker.submitCloudletList(cloudletList);
CloudSim.startSimulation();
CloudSim.stopSimulation();
List<Cloudlet> newList = broker.getCloudletReceivedList();
printCloudletList(newList);
Log.printLine("CloudSim example finished!");
}
catch(Exception ex)
{
ex.printStackTrace();
Log.printLine("Unwanted error occured");

}
}
public static Datacenter createDatacenter(String name)
{
List<Host> hostList = new ArrayList<Host>();
List<Pe> peList = new ArrayList<Pe>();
int mips = 1000;
peList.add(new Pe(0, new PeProvisionerSimple(mips)));
int hostId = 0;
int ram = 2048;
long storage = 1000000;
int bw = 10000;
hostList.add(new Host(hostId, new RamProvisionerSimple(ram), new
BwProvisionerSimple(bw), storage, peList, new VmSchedulerTimeShared(peList)));
String arch = "x86";
String os = "Linux";
String vmm = "Xen";
double time_zone = 10.0;
double cost = 3.0;
double costPerMem = 0.05;
double costPerStorage = 0.001;
double costPerBw = 0.0;
LinkedList<Storage> storageList = new LinkedList<Storage>();
DatacenterCharacteristics characteristics = new DatacenterCharacteristics(arch, os, vmm,
hostList, time_zone, cost, costPerMem, costPerStorage, costPerBw);
Datacenter datacenter = null;
try
{
datacenter=new Datacenter(name, characteristics, new
VmAllocationPolicySimple(hostList), storageList, 0);
}
catch(Exception ex) {
ex.printStackTrace();
}
return datacenter;

}
private static DatacenterBroker createBroker(String name) {
DatacenterBroker broker = null;
try
{
broker = new DatacenterBroker(name);
}
catch(Exception ex)
{
ex.printStackTrace();
}
return broker;
}
private static void printCloudletList(List<Cloudlet> list) {
int size = list.size();
Cloudlet cloudlet;
String indent = " ";
Log.printLine();
Log.printLine("========== OUTPUT ==========");
Log.printLine("Cloudlet ID" + indent + "STATUS" + indent
+ "Data center ID" + indent + "VM ID" + indent + "Time" + indent
+ "Start Time" + indent + "Finish Time");
DecimalFormat dft = new DecimalFormat("###.##");
for (int i = 0; i < size; i++) {
cloudlet = list.get(i);
Log.print(indent + cloudlet.getCloudletId() + indent + indent);
if (cloudlet.getCloudletStatus() == Cloudlet.SUCCESS) {
Log.print("SUCCESS");
Log.printLine(indent + indent + cloudlet.getResourceId()
+ indent + indent + indent + cloudlet.getVmId()
+ indent + indent
+ dft.format(cloudlet.getActualCPUTime()) + indent
+ indent + dft.format(cloudlet.getExecStartTime())
+ indent + indent
+ dft.format(cloudlet.getFinishTime()));
} } } }





2:

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.LinkedList;
import java.util.List;
import org.cloudbus.cloudsim.Cloudlet;
import org.cloudbus.cloudsim.CloudletSchedulerTimeShared;
import org.cloudbus.cloudsim.Datacenter;
import org.cloudbus.cloudsim.DatacenterBroker;
import org.cloudbus.cloudsim.DatacenterCharacteristics;
import org.cloudbus.cloudsim.Host;
import org.cloudbus.cloudsim.Log;
import org.cloudbus.cloudsim.Pe;
import org.cloudbus.cloudsim.Storage;
import org.cloudbus.cloudsim.UtilizationModel;
import org.cloudbus.cloudsim.UtilizationModelFull;
import org.cloudbus.cloudsim.Vm;
import org.cloudbus.cloudsim.VmAllocationPolicySimple;
import org.cloudbus.cloudsim.VmSchedulerTimeShared;
import org.cloudbus.cloudsim.core.CloudSim;
import org.cloudbus.cloudsim.provisioners.BwProvisionerSimple;
import org.cloudbus.cloudsim.provisioners.PeProvisionerSimple;
import org.cloudbus.cloudsim.provisioners.RamProvisionerSimple;
public class second {
private static List<Cloudlet> cloudletList;
private static List<Vm> vmlist;
public static void main(String[] args) {
// TODO code application logic here
Log.printLine("Staring CloudSim ...");

try
{
int num_user = 1;
Calendar calendar = Calendar.getInstance();
boolean trace_flag = false;
CloudSim.init(num_user, calendar, trace_flag);
Datacenter datacenter0 = createDatacenter("Datacenter_0");
DatacenterBroker broker = createBroker("broker1");
int brokerId = broker.getId();
vmlist = new ArrayList<Vm>();
int vmid = 0;
int mips = 250;
long size = 10000;
int ram = 512;
//int ram = 1024;
long bw = 1000;
int pesNumber = 1;
String vmm = "Xen";
Vm vm0 = new Vm(vmid++, brokerId, mips, pesNumber, ram, bw, size, vmm, new
CloudletSchedulerTimeShared());
Vm vm1 = new Vm(vmid++, brokerId, mips, pesNumber, ram, bw, size, vmm, new
CloudletSchedulerTimeShared());
Vm vm2 = new Vm(vmid++, brokerId, mips, pesNumber, ram, bw, size, vmm, new
CloudletSchedulerTimeShared());
//vmlist.add(vm);
vmlist.add(vm0);
vmlist.add(vm1);
vmlist.add(vm2);
broker.submitVmList(vmlist);
cloudletList = new ArrayList<Cloudlet>();
int id = 0;
long length = 400000;
long fileSize = 300;
long outputSize = 300;
UtilizationModel utilizationModel = new UtilizationModelFull();
Cloudlet cloudlet0 = new Cloudlet(id++, length, pesNumber, fileSize, outputSize,

utilizationModel, utilizationModel, utilizationModel);
cloudlet0.setUserId(brokerId);
cloudlet0.setVmId(0);
cloudletList.add(cloudlet0);
Cloudlet cloudlet1 = new Cloudlet(id++, length, pesNumber, fileSize, outputSize,
utilizationModel, utilizationModel, utilizationModel);
cloudlet1.setUserId(brokerId);
cloudlet1.setVmId(1);
cloudletList.add(cloudlet1);
Cloudlet cloudlet2 = new Cloudlet(id++, length, pesNumber, fileSize, outputSize,
utilizationModel, utilizationModel, utilizationModel);
cloudlet2.setUserId(brokerId);
cloudlet2.setVmId(2);
cloudletList.add(cloudlet2);
broker.submitCloudletList(cloudletList);
CloudSim.startSimulation();
CloudSim.stopSimulation();
List<Cloudlet> newList = broker.getCloudletReceivedList();
printCloudletList(newList);
Log.printLine("Cloudsim finished");
}
catch(Exception ex)
{
ex.printStackTrace();
Log.printLine("Unwanted error occured");
}
}
public static Datacenter createDatacenter(String name)
{
List<Host> hostList = new ArrayList<Host>();
List<Pe> peList0 = new ArrayList<Pe>();
List<Pe> peList1 = new ArrayList<Pe>();
List<Pe> peList2 = new ArrayList<Pe>();
int mips = 1000;
peList0.add(new Pe(0, new PeProvisionerSimple(mips)));
peList1.add(new Pe(0, new PeProvisionerSimple(mips)));

peList2.add(new Pe(0, new PeProvisionerSimple(mips)));
int hostId = 0;
int ram = 2048;
long storage = 1000000;
int bw = 10000;
hostList.add(new Host(hostId++, new RamProvisionerSimple(ram), new
BwProvisionerSimple(bw), storage, peList0, new VmSchedulerTimeShared(peList0)));
hostList.add(new Host(hostId++, new RamProvisionerSimple(ram), new
BwProvisionerSimple(bw), storage, peList1, new VmSchedulerTimeShared(peList1)));
hostList.add(new Host(hostId++, new RamProvisionerSimple(ram), new
BwProvisionerSimple(bw), storage, peList2, new VmSchedulerTimeShared(peList2)));
String arch = "x86";
String os = "Linux";
String vmm = "Xen";
double time_zone = 10.0;
double cost = 3.0;
double costPerMem = 0.05;
double costPerStorage = 0.001;
double costPerBw = 0.0;
LinkedList<Storage> storageList = new LinkedList<Storage>();
DatacenterCharacteristics characteristics = new DatacenterCharacteristics(arch, os, vmm,
hostList, time_zone, cost, costPerMem, costPerStorage, costPerBw);
Datacenter datacenter = null;
try
{
datacenter = new Datacenter(name, characteristics, new
VmAllocationPolicySimple(hostList), storageList, 0);
}
catch(Exception ex)
{
ex.printStackTrace();
return null;
}
return datacenter;
}
public static DatacenterBroker createBroker(String name)
{
DatacenterBroker broker = null;
try
{
broker = new DatacenterBroker(name);
}
catch(Exception ex)
{
ex.printStackTrace();

return null;
}
return broker;
}
private static void printCloudletList(List<Cloudlet> list) {
int size = list.size();
Cloudlet cloudlet;
String indent = " ";
Log.printLine();
Log.printLine("========== OUTPUT ==========");
Log.printLine("Cloudlet ID" + indent + "STATUS" + indent
+ "Data center ID" + indent + "VM ID" + indent + "Time" + indent
+ "Start Time" + indent + "Finish Time");
DecimalFormat dft = new DecimalFormat("###.##");
for (int i = 0; i < size; i++) {
cloudlet = list.get(i);
Log.print(indent + cloudlet.getCloudletId() + indent + indent);
if (cloudlet.getCloudletStatus() == Cloudlet.SUCCESS) {
Log.print("SUCCESS");
Log.printLine(indent + indent + cloudlet.getResourceId()
+ indent + indent + indent + cloudlet.getVmId()
+ indent + indent
+ dft.format(cloudlet.getActualCPUTime()) + indent
+ indent + dft.format(cloudlet.getExecStartTime())
+ indent + indent
+ dft.format(cloudlet.getFinishTime()));
} } }}



3:
package org.cloudbus.cloudsim.examples;

/*
 * Title:        CloudSim Toolkit
 * Description:  CloudSim (Cloud Simulation) Toolkit for Modeling and Simulation
 *               of Clouds
 * Licence:      GPL - http://www.gnu.org/copyleft/gpl.html
 *
 * Copyright (c) 2009, The University of Melbourne, Australia
 */

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.LinkedList;
import java.util.List;

import org.cloudbus.cloudsim.Cloudlet;
import org.cloudbus.cloudsim.CloudletSchedulerTimeShared;
import org.cloudbus.cloudsim.Datacenter;
import org.cloudbus.cloudsim.DatacenterBroker;
import org.cloudbus.cloudsim.DatacenterCharacteristics;
import org.cloudbus.cloudsim.Host;
import org.cloudbus.cloudsim.Log;
import org.cloudbus.cloudsim.Pe;
import org.cloudbus.cloudsim.Storage;
import org.cloudbus.cloudsim.UtilizationModel;
import org.cloudbus.cloudsim.UtilizationModelFull;
import org.cloudbus.cloudsim.Vm;
import org.cloudbus.cloudsim.VmAllocationPolicySimple;
import org.cloudbus.cloudsim.VmSchedulerTimeShared;
import org.cloudbus.cloudsim.core.CloudSim;
import org.cloudbus.cloudsim.provisioners.BwProvisionerSimple;
import org.cloudbus.cloudsim.provisioners.PeProvisionerSimple;
import org.cloudbus.cloudsim.provisioners.RamProvisionerSimple;

/**
 * A simple example showing how to create a datacenter with one host and run one
 * cloudlet on it.
 */
public class pract {

	/** The cloudlet list. */
	private static List<Cloudlet> cloudletList;

	/** The vmlist. */
	private static List<Vm> vmlist;

	/**
	 * Creates main() to run this example.
	 *
	 * @param args the args
	 */
	@SuppressWarnings("unused")
	public static void main(String[] args) {

		Log.printLine("Starting CloudSimExample1...");

		try {
			// First step: Initialize the CloudSim package. It should be called
			// before creating any entities.
			int num_user = 1; // number of cloud users
			Calendar calendar = Calendar.getInstance();
			boolean trace_flag = false; // mean trace events

			// Initialize the CloudSim library
			CloudSim.init(num_user, calendar, trace_flag);

			// Second step: Create Datacenters
			// Datacenters are the resource providers in CloudSim. We need at
			// list one of them to run a CloudSim simulation
			Datacenter datacenter0 = createDatacenter("Datacenter_0");

			// Third step: Create Broker
			DatacenterBroker broker = createBroker();
			int brokerId = broker.getId();

			// Fourth step: Create one virtual machine
			vmlist = new ArrayList<Vm>();

			// VM description
			int vmid = 0;
			int mips = 200;
			long size = 10000; // image size (MB)
			int ram = 512; // vm memory (MB)
			long bw = 1000;
			int pesNumber = 1; // number of cpus
			String vmm = "Xen"; // VMM name

			// create VM
			Vm vm = new Vm(vmid, brokerId, mips, pesNumber, ram, bw, size, vmm, new CloudletSchedulerTimeShared());
                        vmid++;
                        Vm vm1 = new Vm(vmid, brokerId, mips, pesNumber, ram, bw, size, vmm, new CloudletSchedulerTimeShared());
                        vmid++;
                        Vm vm2 = new Vm(vmid, brokerId, mips, pesNumber, ram, bw, size, vmm, new CloudletSchedulerTimeShared());
                        vmid++;
                        Vm vm3 = new Vm(vmid, brokerId, mips, pesNumber, ram, bw, size, vmm, new CloudletSchedulerTimeShared());

			// add the VM to the vmList
			vmlist.add(vm);
                        vmlist.add(vm1);
                        vmlist.add(vm2);
                        vmlist.add(vm3);
                        

			// submit vm list to the broker
			broker.submitVmList(vmlist);

			// Fifth step: Create one Cloudlet
			cloudletList = new ArrayList<Cloudlet>();

			// Cloudlet properties
			int id = 0;
			long length = 400000;
			long fileSize = 300;
			long outputSize = 300;
			UtilizationModel utilizationModel = new UtilizationModelFull();

			Cloudlet cloudlet = new Cloudlet(id++, length, pesNumber, fileSize, outputSize, utilizationModel, utilizationModel, utilizationModel);
			cloudlet.setUserId(brokerId);
			cloudlet.setVmId(0);
                        
                        Cloudlet cloudlet1 = new Cloudlet(id++, length, pesNumber, fileSize, outputSize, utilizationModel, utilizationModel, utilizationModel);
			cloudlet1.setUserId(brokerId);
			cloudlet1.setVmId(1);
                        
                         Cloudlet cloudlet2 = new Cloudlet(id++, length, pesNumber, fileSize, outputSize, utilizationModel, utilizationModel, utilizationModel);
			cloudlet2.setUserId(brokerId);
			cloudlet2.setVmId(2);
                        
                         Cloudlet cloudlet3 = new Cloudlet(id++, length, pesNumber, fileSize, outputSize, utilizationModel, utilizationModel, utilizationModel);
			cloudlet3.setUserId(brokerId);
			cloudlet3.setVmId(3);

			// add the cloudlet to the list
			cloudletList.add(cloudlet);
                        cloudletList.add(cloudlet1);
                        cloudletList.add(cloudlet2);
                        cloudletList.add(cloudlet3);

			// submit cloudlet list to the broker
			broker.submitCloudletList(cloudletList);

			// Sixth step: Starts the simulation
			CloudSim.startSimulation();

			CloudSim.stopSimulation();

			//Final step: Print results when simulation is over
			List<Cloudlet> newList = broker.getCloudletReceivedList();
			printCloudletList(newList);

			Log.printLine("CloudSimExample1 finished!");
		} catch (Exception e) {
			e.printStackTrace();
			Log.printLine("Unwanted errors happen");
		}
	}

	/**
	 * Creates the datacenter.
	 *
	 * @param name the name
	 *
	 * @return the datacenter
	 */
	private static Datacenter createDatacenter(String name) {

		// Here are the steps needed to create a PowerDatacenter:
		// 1. We need to create a list to store
		// our machine
		List<Host> hostList = new ArrayList<Host>();

		// 2. A Machine contains one or more PEs or CPUs/Cores.
		// In this example, it will have only one core.
		List<Pe> peList = new ArrayList<Pe>();

		int mips = 1000;

		// 3. Create PEs and add these into a list.
		peList.add(new Pe(0, new PeProvisionerSimple(mips))); // need to store Pe id and MIPS Rating

		// 4. Create Host with its id and list of PEs and add them to the list
		// of machines
		int hostId = 0;
		int ram = 2048; // host memory (MB)
		long storage = 1000000; // host storage
		int bw = 10000;

		hostList.add(
			new Host(
				hostId,
				new RamProvisionerSimple(ram),
				new BwProvisionerSimple(bw),
				storage,
				peList,
				new VmSchedulerTimeShared(peList)
			)
		); // This is our machine

		// 5. Create a DatacenterCharacteristics object that stores the
		// properties of a data center: architecture, OS, list of
		// Machines, allocation policy: time- or space-shared, time zone
		// and its price (G$/Pe time unit).
		String arch = "x86"; // system architecture
		String os = "Linux"; // operating system
		String vmm = "Xen";
		double time_zone = 10.0; // time zone this resource located
		double cost = 3.0; // the cost of using processing in this resource
		double costPerMem = 0.05; // the cost of using memory in this resource
		double costPerStorage = 0.001; // the cost of using storage in this
										// resource
		double costPerBw = 0.0; // the cost of using bw in this resource
		LinkedList<Storage> storageList = new LinkedList<Storage>(); // we are not adding SAN
													// devices by now

		DatacenterCharacteristics characteristics = new DatacenterCharacteristics(
				arch, os, vmm, hostList, time_zone, cost, costPerMem,
				costPerStorage, costPerBw);

		// 6. Finally, we need to create a PowerDatacenter object.
		Datacenter datacenter = null;
		try {
			datacenter = new Datacenter(name, characteristics, new VmAllocationPolicySimple(hostList), storageList, 0);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return datacenter;
	}

	// We strongly encourage users to develop their own broker policies, to
	// submit vms and cloudlets according
	// to the specific rules of the simulated scenario
	/**
	 * Creates the broker.
	 *
	 * @return the datacenter broker
	 */
	private static DatacenterBroker createBroker() {
		DatacenterBroker broker = null;
		try {
			broker = new DatacenterBroker("Broker");
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return broker;
	}

	/**
	 * Prints the Cloudlet objects.
	 *
	 * @param list list of Cloudlets
	 */
	private static void printCloudletList(List<Cloudlet> list) {
		int size = list.size();
		Cloudlet cloudlet;

		String indent = "    ";
		Log.printLine();
		Log.printLine("========== OUTPUT ==========");
		Log.printLine("Cloudlet ID" + indent + "STATUS" + indent
				+ "Data center ID" + indent + "VM ID" + indent + "Time" + indent
				+ "Start Time" + indent + "Finish Time");

		DecimalFormat dft = new DecimalFormat("###.##");
		for (int i = 0; i < size; i++) {
			cloudlet = list.get(i);
			Log.print(indent + cloudlet.getCloudletId() + indent + indent);

			if (cloudlet.getCloudletStatus() == Cloudlet.SUCCESS) {
				Log.print("SUCCESS");

				Log.printLine(indent + indent + cloudlet.getResourceId()
						+ indent + indent + indent + cloudlet.getVmId()
						+ indent + indent
						+ dft.format(cloudlet.getActualCPUTime()) + indent
						+ indent + dft.format(cloudlet.getExecStartTime())
						+ indent + indent
						+ dft.format(cloudlet.getFinishTime()));
			}
		}
	}

}
