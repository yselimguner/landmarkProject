//
//  ViewController.swift
//  LandMark Project15
//
//  Created by Yavuz Güner on 19.02.2022.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var landmarkNames = [String]()
    var landmarkImages = [UIImage]()
    var landmarkText = [String]()
    
    var chosenLandmarkName = ""
    var chosenLandmarkImage = UIImage()
    var chosenLandmarkText = ""
    
    

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self //self yazarsak viewController yazmış oluruz
        tableView.dataSource=self
        
        navigationItem.title = "Landmark Suggestion"
        
        //LANDMARK BOOK DATA
        landmarkNames.append("Ayasofya Camii")
        landmarkNames.append("Galata Kulesi")
        landmarkNames.append("Kız Kulesi")
        landmarkNames.append("Topkapı Sarayı")
        
       
        landmarkImages.append(UIImage(named: "AyasofyaCamii.jpeg")!)
        landmarkImages.append(UIImage(named: "GalataKulesi.jpeg")!)
        landmarkImages.append(UIImage(named: "KızKulesi.jpeg")!)
        landmarkImages.append(UIImage(named: "TopkapıSarayı.jpeg")!)
        
        
        landmarkText.append("Ayasofya Müzesi (Yunanca: Ἁγία Σοφία Hagía Sophía), İstanbul'da yer alan bir cami, eski bazilika, katedral ve müze. Bizans İmparatoru I. Justinianus tarafından, 532-537 yılları arasında İstanbul'un tarihî yarımadasındaki eski şehir merkezine inşa ettirilmiş bazilika planlı bir patrik katedrali olup 1453 yılında İstanbul'un Osmanlılar tarafından fethedilmesinden sonra II. Mehmed tarafından camiye dönüştürülmüştür. Mustafa Kemal Atatürk tarafından 1934 yılında yayımlanan Bakanlar Kurulu Kararnamesi ile müzeye dönüştürülmüş, kazı ve tadilat çalışmaları başlatılmış ve 1935-2020 yılları arasında her inanç grubundan insanlar için müze olarak hizmet vermiştir. 2020 yılında ise müze statüsü iptal edilerek cami statüsü verilmiştir.")
        
        landmarkText.append("Galata Kulesi ya da müze olarak kullanılmaya başlaması sonrasındaki adıyla Galata Kulesi Müzesi, Türkiye'nin İstanbul şehrinin Beyoğlu ilçesinde bulunan bir kuledir. Adını, bulunduğu Galata semtinden alır. Galata Surları dahilinde bir gözetleme kulesi olarak inşa edilen kule günümüzde, bir sergi alanı ve müze olarak kullanılır. Hem Beyoğlu'nun hem de İstanbul'un sembol yapılarından biridir.")
        
        landmarkText.append("Kız Kulesi, hakkında çeşitli rivayetler anlatılan, efsanelere konu olan, İstanbul Boğazı'nın Marmara Denizi'ne yakın kısmında, Salacak açıklarında yer alan küçük adacık üzerinde inşa edilmiş yapıdır.")
        
        landmarkText.append("Topkapı Sarayı (Osmanlı Türkçesi: طوپقپو سرايى), İstanbul Sarayburnu'nda, Osmanlı İmparatorluğu'nun 600 yıllık tarihinin 400 yılı boyunca, devletin idare merkezi olarak kullanılan ve Osmanlı padişahlarının yaşadığı saraydır. Bir zamanlar içinde 4.000'e yakın insan yaşamıştır.")
        
        
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            landmarkNames.remove(at: indexPath.row)
            landmarkImages.remove(at: indexPath.row)
            landmarkText.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade) //animasyonlu sileyim mi diyor.)
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = landmarkNames[indexPath.row]// Yukarıda indexpath diziliyor
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return landmarkNames.count //Kaç tane eklersek o kadaar bize aslında sçeenek oluşturuyor
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        chosenLandmarkName = landmarkNames[indexPath.row]
        chosenLandmarkImage = landmarkImages[indexPath.row]
        chosenLandmarkText = landmarkText[indexPath.row]
        
        performSegue(withIdentifier: "toViewControllerSecond", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toViewControllerSecond"{
            let destinationVC = segue.destination as! ViewControllerSecond
            destinationVC.selectedLandmarkName = chosenLandmarkName
            destinationVC.selectedLandmarkImage = chosenLandmarkImage
            destinationVC.selectedLandmarkText = chosenLandmarkText
        }
    }

}

