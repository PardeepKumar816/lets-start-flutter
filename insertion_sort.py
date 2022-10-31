#include <cassert>

#include <algorithm>
#include <iostream>
#include <vector>

template<class T>
void print(std::vector<T> const & xs) {
    for (size_t i = 0; i < xs.size(); i++)
        std::cout << xs.at(i) << " ";
    std::cout << std::endl;
}

struct Insertion {
    template<class T>
    static void sort(std::vector<T> & xs) {
        int const len = xs.size();
        // For each xs(i)...
        for (int i = 1; i < len; i++) {
            // Swap xs(i) into the correct position within xs(0..i).
            for (int j = i; j > 0; j--) {
                T & t1 = xs.at(j - 1);
                T & t2 = xs.at(j    );

                if (t1 > t2)
                    std::swap(t1, t2);
                else
                    break;
            }
        }
    }
};
