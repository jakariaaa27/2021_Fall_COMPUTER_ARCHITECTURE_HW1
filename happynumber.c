#include<stdio.h>

int main()
{

	int n = 2 ,sum,rem;
	
	while(n>0)
	{
		rem = n%10;
		sum += rem * rem;
		n=n/10;

		if(n == 0 && sum >= 10)
		{
			n = sum;
			sum = 0;
		}
	}

	if(sum == 1){
		printf("true");
	}else{
		printf("false");
	}

}