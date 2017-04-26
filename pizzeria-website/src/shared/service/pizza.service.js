export class PizzaService{
	
	constructor($http, localStorageService, $q){
		this.localStorageService = localStorageService
		this.$http=$http
		this.$q=$q
	}
	
	getPizzas(){
		if(!this.localStorageService.get('pizzas')){
			this.$http.get(`${this.API_URL}/pizzas`).then(r=>this.localStorageService.set('pizzas',r.data,'localStorage'))
		}
		return this.$q.resolve(this.localStorageService.get('pizzas'))
	}	
} 