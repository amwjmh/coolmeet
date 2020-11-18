var app = new Vue({
        el:"#am",

        data(){
            return{
                info:null
            }
        },
        mounted(){

            // var than = this;
            axios.get('${pageContext.request.contextPath}/notifications/meetingdata?employeeid=${judgment.employeeid}').then(
                response=>(
                    this.info = response.data,
                        console.log(this.info)
                )
            );
        }


    })