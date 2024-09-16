#include <iostream>
#include <opencv2/core.hpp>
#include <opencv2/ml.hpp>

int main() {
    cv::Ptr<cv::ml::KNearest> knn = cv::ml::KNearest::create();                 
    std::cout << "Hello, Zaz!" << std::endl;
    return 0;
}