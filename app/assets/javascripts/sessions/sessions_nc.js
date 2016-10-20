var LoginModalController = {
    tabsElementName: ".logmod__tabs li",
    tabElementName: ".logmod__tab",
    inputElementsName: ".logmod__form .input",
    hidePasswordName: ".hide-password",
    
    inputElements: null,
    tabsElement: null,
    tabElement: null,
    hidePassword: null,
    
    activeTab: null,
    tabSelection: 0, // 0 - first, 1 - second
    
    findElements: function () {
        var base = this;
        
        base.tabsElement = /* $ global*/(base.tabsElementName);
        base.tabElement = /* $ global*/(base.tabElementName);
        base.inputElements = /* $ global*/(base.inputElementsName);
        base.hidePassword = /* $ global*/(base.hidePasswordName);
        
        return base;
    },
    
    setState: function (state) {
    	var base = this,
            elem = null;
        
        if (!state) {
            state = 0;
        }
        
        if (base.tabsElement) {
        	elem = /* $ global*/(base.tabsElement[state]);
            elem.addClass("current");
            /* $ global*/("." + elem.attr("data-tabtar")).addClass("show");
        }
  
        return base;
    },
    
    getActiveTab: function () {
        var base = this;
        
        base.tabsElement.each(function (i, el) {
           if (/* $ global*/(el).hasClass("current")) {
               base.activeTab = /* $ global*/(el);
           }
        });
        
        return base;
    },
   
    addClickEvents: function () {
    	var base = this;
        
        base.hidePassword.on("click", function (e) {
            var $this = /* $ global*/(this),
                $pwInput = $this.prev("input");
            
            if ($pwInput.attr("type") == "password") {
                $pwInput.attr("type", "text");
                $this.text("Hide");
            } else {
                $pwInput.attr("type", "password");
                $this.text("Show");
            }
        });
 
        base.tabsElement.on("click", function (e) {
            var targetTab = /* $ global*/(this).attr("data-tabtar");
            
            e.preventDefault();
            base.activeTab.removeClass("current");
            base.activeTab = /* $ global*/(this);
            base.activeTab.addClass("current");
            
            base.tabElement.each(function (i, el) {
                el = /* $ global*/(el);
                el.removeClass("show");
                if (el.hasClass(targetTab)) {
                    el.addClass("show");
                }
            });
        });
        
        base.inputElements.find("label").on("click", function (e) {
           var $this = /* $ global*/(this),
               $input = $this.next("input");
            
            $input.focus();
        });
        
        return base;
    },
    
    initialize: function () {
        var base = this;
        
        base.findElements().setState().getActiveTab().addClickEvents();
    }
};

/* $ global*/(document).ready(function() {
    LoginModalController.initialize();
});
