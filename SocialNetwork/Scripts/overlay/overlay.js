(function () {

    var defaults = {        
        debug: true,
        message: "Waiting...",
        messageSelector: ".overlay-message",
        onShow: null,
        overlaySelector: ".overlay"
    };

    function setElements(overlay, opts) {
        overlay.$overlay = $(opts.overlaySelector);
        overlay.$message = $(opts.messageSelector);
    }
    
    function setInitialValues(overlay) {
        overlay.isInitialized = true;
        overlay.isVisible = false;
    }

    function throwErrorIfNotInitialized(overlay) {
        if (!overlay.isInitialized) {
            throw Error("Overlay has not been initialized!");
        }            
    }
    
    function writeLog(message) {
        if (overlay.options.debug && console && console.log) {
            console.log("overlay: " + message);
        }
    }

    window.overlay = {
        
        hide: function () {
            writeLog("Hiding overlay.");
            this.$overlay.hide();
            this.isVisible = false;
            return this;
        },

        initialize: function (opts) {            
            this.options = $.extend(defaults, opts);
            setElements(this, this.options);
            setInitialValues(this);
            writeLog("Overlay is initialized.");
            return this;
        },

        options: null,

        show: function (opts) {
            throwErrorIfNotInitialized(this);
            writeLog("Showing overlay.");
            var message = (opts && opts.message) || this.options.message;
            this.$message.text(message);
            this.$overlay.show();
            this.isVisible = true;
            if (this.options.onShow) {
                this.options.onShow();
            }
            return this;
        },

    };

})();