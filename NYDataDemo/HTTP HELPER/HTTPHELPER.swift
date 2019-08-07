


import UIKit

extension NSMutableData {
    
    @objc func appendString(string: String) {
        let data = string.data(using: String.Encoding.utf8, allowLossyConversion: true)
        append(data!)
    }
}



class HTTPHelperGet{
    
    enum HTTPMethodRequest: String{
        case get = "GET"
    }
    
    private static var instance: HTTPHelperGet!
    
    static var shared: HTTPHelperGet{
        get{
            if instance == nil {
                instance = HTTPHelperGet()
            }
            return instance
        }
    }
    
    func request(url: String, params: Data?, completion: @escaping (Result<Data, Error>)->Void){
        
        var normalStr = ""
        
        do{
            
            if let params = params{
                
                if let para = try JSONSerialization.jsonObject(with: params, options: []) as? [String: Any]{
                    
                    print(para.description)
                    
                    let str = para.description
                    
                    let firstStr = str.replacingOccurrences(of: " ", with: "")
                    
                    let newStr =  firstStr.replacingOccurrences(of: ":", with: "=")
                    
                    let latestStr = newStr.replacingOccurrences(of: ",", with: "&")
                    
                    let normalUrl = latestStr.replacingOccurrences(of: "\"", with: "")
                    
                    let doneStr = normalUrl.replacingOccurrences(of: "[", with: "")
                    
                    let againStr = doneStr.replacingOccurrences(of: "]", with: "")
                    
                    normalStr = againStr
                }
            }
        }catch let err{
            print(err)
            completion(.failure(err))
        }
        
        guard let completeURL = URL(string: "\(url)?\(normalStr as AnyObject)") else {return}
        
        print(completeURL)
        
        let urlRequest = URLRequest(url: completeURL)
        
        let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            
            print("DATA IS: \(data?.getResponse() as Any)")
            
            guard error == nil else {
                
                completion(.failure(error!))
                
                return
            }
            if data != nil {
                
                completion(.success(data ?? Data()))
            }
        }
        task.resume()
    }
}
