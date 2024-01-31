//
//  ExerciseCoordinator.swift
//  HealthySecret
//
//  Created by 양승완 on 2023/11/20.
//

import UIKit
import Foundation



class ExerciseCoordinator: Coordinator {
    
    
    var childCoordinator: [Coordinator] = []
        
    var navigationController: UINavigationController
    
    var parentCoordinator : Coordinator?
    
    var finishDelegate: CoordinatorFinishDelegate?
    
    var type: CoordinatorType = .exercise
    
    required init(_ navigationController: UINavigationController ) {
        self.navigationController = navigationController
    }
    
    func start() {
        let firebaseService = FirebaseService()
        let viewModel = ExerciseVM(coordinator: self, firebaseService: firebaseService)
        let ExerciseViewController = ExerciseViewController(viewModel: viewModel)
        self.navigationController.pushViewController(ExerciseViewController, animated: false)
        
        
        
        
    }
    
    func pushDetailVC(model : Data){
        
        let firebaseService = FirebaseService()
        let viewModel = DetailPageVM(coordinator: self, firebaseService: firebaseService)
        viewModel.model = model
        let detailPageViewController = DetailPageViewController(viewModel: viewModel)
        

        self.navigationController.pushViewController(detailPageViewController, animated: true)

    }
    
    func back() {
        finishDelegate?.coordinatorDidFinish(childCoordinator: self)
        
        
        
    }
    
   
    
    
}

extension ExerciseCoordinator : CoordinatorFinishDelegate {
    func coordinatorDidFinish(childCoordinator: Coordinator) {
        print("CalendarDidFinished")
        self.childCoordinator = self.childCoordinator
            .filter({ $0.type != childCoordinator.type })
        childCoordinator.navigationController.popToRootViewController(animated: true)
    }
    
    
}
