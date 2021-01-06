//  Copyright © 2020 VenueNext. All rights reserved.

import UIKit
import VNWebSDK

class DemoTableViewController: UITableViewController, VNAnalyticsProtocol {
    
    enum Section: CaseIterable {
         case push
         case modal
         
         var displayName: String {
             switch self {
             case .push:
                 return "Push"
             case .modal:
                 return "Modal Presentation"
             }
         }
         
         var rows: [LinkType] {
             switch self {
             case .push:
                return [.pushFoodList, .pushMerchList, .pushExperienceList, .pushFoodMenu, .pushMerchMenu, .pushExperienceMenuWithoutEvent, .pushExperienceMenuWithEvent, .pushExperienceDetailWithoutEvent,
                        .pushExperienceDetailWithEvent, .pushFoodListDelivery, .pushFoodListPickup, .pushWallet, .pushVirtualCurrencyActivity, .pushOrderHistory, .pushOrderReceipt]
             case .modal:
                 return [.modalFoodList, .modalMerchList, .modalExperienceList, .modalFoodMenu, .modalMerchMenu, .modalExperienceMenu, .modalExperienceDetail, .modalOrderHistory, .modalFoodReceipt, .modalExperienceReceipt, .modalExperienceItem]
             }
         }
     }
     
    enum LinkType: CaseIterable {
        case modalFoodList
        case modalMerchList
        case modalExperienceList
        case modalFoodMenu
        case modalMerchMenu
        case modalExperienceMenu
        case modalExperienceDetail
        case modalOrderHistory
        case modalFoodReceipt
        case modalExperienceReceipt
        case modalExperienceItem

        case pushFoodList
        case pushMerchList
        case pushExperienceList
        case pushFoodMenu
        case pushMerchMenu
        case pushExperienceMenuWithoutEvent
        case pushExperienceMenuWithEvent
        case pushExperienceDetailWithoutEvent
        case pushExperienceDetailWithEvent
        case pushFoodListDelivery
        case pushFoodListPickup
        case pushWallet
        case pushVirtualCurrencyActivity
        case pushOrderHistory
        case pushOrderReceipt
          
        var name: String {
            let modal = "Modal - "
            let push = "Push - "
            switch self {
            case .modalFoodList:
                return modal + "Food RvCs"
            case .modalMerchList:
                return modal + "Merch RvCs"
            case .modalExperienceList:
                return modal + "Experience RvCs"
            case .modalFoodMenu:
                return modal + "Food Menu"
            case .modalMerchMenu:
                return modal + "Merch Menu"
            case .modalExperienceMenu:
                return modal + "Experience Menu"
            case .modalExperienceDetail:
                return modal + "Experience Details"
            case .modalOrderHistory:
                return modal + "Order History"
            case .modalFoodReceipt:
                return modal + "Food Receipt"
            case .modalExperienceReceipt:
                return modal + "Experience Receipt"
            case .modalExperienceItem:
                return modal + "Experience Item"
            case .pushFoodList:
                return push + "Food RvCs"
            case .pushMerchList:
                return push + "Merch RvCs"
            case .pushExperienceList:
                return push + "Experience RvCs"
            case .pushFoodMenu:
                return push + "Food Menu"
            case .pushMerchMenu:
                return push + "Merch Menu"
            case .pushExperienceMenuWithoutEvent:
                return push + "Experience Menu w/o Event"
            case .pushExperienceMenuWithEvent:
                return push + "Experience Menu w/ Event"
            case .pushExperienceDetailWithoutEvent:
                return push + "Experience Details w/o Event"
            case .pushExperienceDetailWithEvent:
                return push + "Experience Details w/ Event"
            case .pushFoodListDelivery:
                return push + "Food Menu - Delivery"
            case .pushFoodListPickup:
                return push + "Food Menu - Pickup"
            case .pushWallet:
                return push + "Wallet"
            case .pushVirtualCurrencyActivity:
                return push + "Virtual Currency Activity"
            case .pushOrderHistory:
                return push + "Order History"
            case .pushOrderReceipt:
                return push + "Order Receipt"
            }
        }
    }
    
    // MARK: Initializing
    
    public init() {
        super.init(nibName: String(describing: DemoTableViewController.self), bundle: Bundle(for: type(of: self)))
        
        VenueNextWeb.shared.configureAnalytics(self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(LinkTableViewCell.self, forCellReuseIdentifier: "LinkTableViewCell")
    }
    
    // MARK: UITableView Overrides
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return Section.allCases.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Section.allCases[section].rows.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LinkTableViewCell", for: indexPath) as! LinkTableViewCell
        
        let section = Section.allCases[indexPath.section]
        let linkType = section.rows[indexPath.row]
        cell.textLabel?.text = linkType.name
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let section = Section.allCases[indexPath.section]
        let linkType = section.rows[indexPath.row]
        
        switch linkType {
        case .pushFoodList:
            navigationController?.pushFnB()
        case .pushMerchList:
            navigationController?.pushMerchandise()
        case .pushExperienceList:
            navigationController?.pushExperiences()
        case .pushFoodMenu:
            navigationController?.pushFnBMenu(menu: "55559869-3e16-4acd-87e5-a35f7e49a8de")
        case .pushMerchMenu:
            navigationController?.pushMerchandiseMenu(menu: "a5f8e571-fe8a-44c7-a694-b9dbaab05737")
        case .pushExperienceMenuWithoutEvent:
            navigationController?.pushExperienceMenu(menu: "399f78b7-5576-48e2-abd8-99d390c042ee", event: nil)
        case .pushExperienceMenuWithEvent:
            navigationController?.pushExperienceMenu(menu: "399f78b7-5576-48e2-abd8-99d390c042ee", event: "c7b19487-f24b-433e-aaf9-29f150893b22")
        case .pushExperienceDetailWithoutEvent:
            navigationController?.pushExperienceDetails(menu: "399f78b7-5576-48e2-abd8-99d390c042ee", item: "185bcd46-467c-4513-9ff6-56e598c76be1", event: nil, variant: nil)
        case .pushExperienceDetailWithEvent:
            navigationController?.pushExperienceDetails(menu: "399f78b7-5576-48e2-abd8-99d390c042ee", item: "5a7ef0f6-be46-4bb8-8106-5bd6b6460232", event: "1d17ec1b-12f2-44a6-84bc-0713a6bfc2c1", variant: "variant-uuid")
        case .pushFoodListDelivery:
            navigationController?.pushFnB(serviceType: ServiceType.delivery)
        case .pushFoodListPickup:
            navigationController?.pushFnB(serviceType: ServiceType.pickup)
        case .pushWallet:
            navigationController?.pushWallet()
        case .pushVirtualCurrencyActivity:
            navigationController?.pushVirtualCurrencyActivity()
        case .pushOrderHistory:
            navigationController?.pushOrderHistory()
        case .pushOrderReceipt:
            navigationController?.pushOrderReceipt(receipt: "5cdd721d-5950-45b7-abdc-b4b5e74675d2")
        default:
            print("default")
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let section = Section.allCases[section]
        return section.displayName.uppercased()
    }
    
    // MARK: VNAnalyticsProtocol Overrides
    
    func trackUserId(_ id: String) {
        print("Track User ID Analytics Event: \(id)")
    }
    
    func trackRvcSelection(itemId: String, itemName: String, itemCategory: String) {
        print("Track RVC Selection Analytics Event: \(itemId), \(itemName), \(itemCategory)")
    }
    
    func trackMenuItemSelection(itemId: String, itemName: String, itemCategory: String, variant: String, price: Int) {
        print("Track Menu Item Selection Analytics Event: \(itemId), \(itemName), \(itemCategory), \(variant), \(price)")
    }
    
    func trackBeginCheckout() {
        print("Track Begin Checkout Analytics Event")
    }
    
    func trackAddItemToCart(itemId: String, itemName: String, itemCategory: String, variant: String, price: Int, quantity: Int) {
        print("Track Add Item To Cart Analytics Event: \(itemId), \(itemName), \(itemCategory), \(variant), \(price), \(quantity)")
    }
    
    func trackRemoveItemFromCart(itemId: String, itemName: String, itemCategory: String, variant: String, price: Int, quantity: Int) {
        print("Track Remove Item From Cart Analtyics Event: \(itemId), \(itemName), \(itemCategory), \(variant), \(price), \(quantity)")
    }
    
    func trackCompletedPurchase(orderId: String, quantity: Int, discount: Double, tips: Double, tax: Double, total: Double, paymentTypes: String?) {
        print("Track Completed Purchase Analytics Event: \(orderId), \(quantity), \(discount), \(tips), \(tax), \(total), \(paymentTypes)")
    }
    
    func trackCheckoutProgress(orderId: String, state: String) {
        print("Track Checkout Progress Analytics Event: \(orderId), \(state)")
    }
    
    func trackUserAffiliations(_ affiliations: [String]) {
        print("Track User Affiliations Analytics Event: \(affiliations)")
    }
}
