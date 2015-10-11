#include <bits/stdc++.h>

using  namespace std;
const int maxN = 100005;
const int mod = (int)1e9 + 7;

char a[maxN];

int main(){

 //  freopen("in.c","r",stdin);

    int n , t;
    cin >> n >> t;
    if(n == 1){
        if(t <= 9){
            cout << t << endl;
        }else{
            cout << -1 << endl;
        }
        return 0;

    }

    int mod = 0;
    for(int i = 0; i < n - 1; ++i){
        cout << 1;
        mod = (mod * 10 + 1) % t;
    }

    for(int dig = 0; dig < 10; ++dig){
        if( (mod * 10 + dig) % t == 0){
            cout << dig << endl;
            return 0;
        }
    }
    cout << -1 << endl;




}
