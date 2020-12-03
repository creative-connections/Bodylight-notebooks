Příprava prostředí pro příštích několik cvičení a přednášek MOS (Modelování a Simulace). Nemusíte psát report. Ale na cvičení, přednášce budeme potřebovat. 

1) nainstalujte si potřebný software

  * HW: minimum 1 CPU, 4 GB RAM, min 7GB na disku.
  * Operační systém: jakýkoliv, kam se dá nainstalovat virtualizační platforma VirtualBox a nástroj Vagrant (Windows 7,Windows 10, Ubuntu 16.04, ...)
  * 1) SW: instalujte [VirtualBox](https://www.virtualbox.org/wiki/Downloads),
    * pro Windows stáhnete instalačky na linku, ve Windows 10 jsme se setkali během vytváření virtuální mašiny (VM) s chybou(VERR_NEM_VM_CREATE_FAILED - need to disable Windows features (V-Host) and see howto setup Windows 10 at https://forums.virtualbox.org/viewtopic.php?f=6&t=93712))
    * v Linuxu lze podle typu použít `apt install virtualbox` (DEBIAN,UBUNTU,...) nebo `yum install virtualbox` (RHEL,CENTOS,...)

    * 1a) SW: do VirtualBoxu si stáhněte ještě tzv. extension pack (https://www.virtualbox.org/wiki/Downloads a v druhé sekci "VirtualBox 6.1.16 Oracle VM VirtualBox Extension Pack" kliknout na "All supported platforms" a mělo by se to instalovat do existujícího VirtualBoxu)
  * 2) SW: instalujte vagrant [Vagrant](https://www.vagrantup.com/downloads.html)
    * pro Windows stáhněte a spustťe instalačky na linku výše
    * v Linuxu dle typu opět můžete použít `apt install vagrant` nebo `yum install vagrant`
  * 3) SW: instalujte GIT
    * pro Windows [GIT](https://git-scm.com/download)
    * pro Linux `apt install git` nebo `yum install git`
     
2) v terminálu Linuxu (xterm, terminal, ...) nebo příkazovém řádku Windows (`Start ->` pište 'cmd' a Enter, měla by se spustit 'Command Prompt' nebo počeštělá 'Příkazová řádka')
napište postupně tyto příkazy
```
git clone https://github.com/creative-connections/Bodylight-notebooks.git
git clone https://github.com/creative-connections/Bodylight-VirtualMachine.git
cd Bodylight-VirtualMachine
vagrant up     
```

Pote byste meli videt instalaci virtualni masiny. Bude se stahovat az 2GB dat, primarni obraz VM (600 MB) a instalacni soubory (OpenModelica 700 MB, Anaconda 500 MB, ...)

Po 5-45 minutach by melo byt vse nainstalovane

3) Kontrola
  * muzete pristoupit primo do desktopu virtualni masiny ve VirtualBoxu
  * v prohlizeci fyzicke masiny zadejte adresu http://localhost:8080 a mela by se vam obrazovka a dlazdice s odkazy na software virtualni masine
  
4) Spustte JUPYTER notebook
  * v prohlizeci fyzicke masiny zadejte adresu http://localhost:8080/jupyter a vyhledejte `Bodylight-notebooks/Seminar8FmiIdentification` a otevrete notebooky (pripona `.ipynb`)


5) zastaveni VM
```
cd Bodylight-VirtualMachine
vagrant halt
```
pripadne muzete pouzit v desktopu VM jine metody jako `sudo shutdown now -h` atd.

6) opetovne spusteni VM
```
cd Bodylight-VirtualMachine
vagrant up
```
opetovne pusti virtualni masinu za 1 minutu - nyni uz bez pocatecni instalace vseho softwaru, ale s nastavenym presmerovanim portu 22 a 80
