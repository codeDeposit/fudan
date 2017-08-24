!function(e,
t,
n){
    "use strict";!functiono(e,
    t,
    n){
        functiona(s,
        l){
            if(!t[
                s
            ]){
                if(!e[
                    s
                ]){
                    vari="function"==typeofrequire&&require;if(!l&&i)returni(s,
                    !0);if(r)returnr(s,
                    !0);varu=newError("Cannot find module '"+s+"'");throwu.code="MODULE_NOT_FOUND",
                    u
                }varc=t[
                    s
                ]={
                    exports: {
                        
                    }
                };e[
                    s
                ][
                    0
                ].call(c.exports,
                function(t){
                    varn=e[
                        s
                    ][
                        1
                    ][
                        t
                    ];returna(n?n: t)
                },
                c,
                c.exports,
                o,
                e,
                t,
                n)
            }returnt[
                s
            ].exports
        }for(varr="function"==typeofrequire&&require,
        s=0;s<n.length;s++)a(n[
            s
        ]);returna
    }({
        1: [
            function(o,
            a,
            r){
                functions(e){
                    returne&&e.__esModule?e: {
                        "default": e
                    }
                }Object.defineProperty(r,
                "__esModule",
                {
                    value: !0
                });varl,
                i,
                u,
                c,
                d=o("./modules/handle-dom"),
                f=o("./modules/utils"),
                p=o("./modules/handle-swal-dom"),
                m=o("./modules/handle-click"),
                v=o("./modules/handle-key"),
                y=s(v),
                b=o("./modules/default-params"),
                h=s(b),
                g=o("./modules/set-params"),
                w=s(g);r[
                    "default"
                ]=u=c=function(){
                    functiono(e){
                        vart=a;returnt[
                            e
                        ]===n?h[
                            "default"
                        ][
                            e
                        ]: t[
                            e
                        ]
                    }vara=arguments[
                        0
                    ];if((0,
                    d.addClass)(t.body,
                    "stop-scrolling"),
                    (0,
                    p.resetInput)(),
                    a===n)return(0,
                    f.logStr)("SweetAlert expects at least 1 attribute!"),
                    !1;varr=(0,
                    f.extend)({
                        
                    },
                    h[
                        "default"
                    ]);switch(typeofa){
                        case"string": r.title=a,
                        r.text=arguments[
                            1
                        ]||"",
                        r.type=arguments[
                            2
                        ]||"";break;case"object": if(a.title===n)return(0,
                        f.logStr)('Missing"title"argument!'),
                        !1;r.title=a.title;for(varsinh[
                            "default"
                        ])r[
                            s
                        ]=o(s);r.confirmButtonText=r.showCancelButton?"Confirm": h[
                            "default"
                        ].confirmButtonText,
                        r.confirmButtonText=o("confirmButtonText"),
                        r.doneFunction=arguments[
                            1
                        ]||null;break;default: return(0,
                        f.logStr)('Unexpectedtypeofargument!Expected"string"or"object",
                        got'+typeofa),
                        !1
                    }(0,
                    w[
                        "default"
                    ])(r),
                    (0,
                    p.fixVerticalPosition)(),
                    (0,
                    p.openModal)(arguments[
                        1
                    ]);for(varu=(0,
                    p.getModal)(),
                    v=u.querySelectorAll("button"),
                    b=[
                        "onclick",
                        "onmouseover",
                        "onmouseout",
                        "onmousedown",
                        "onmouseup",
                        "onfocus"
                    ],
                    g=function(e){
                        return(0,
                        m.handleButton)(e,
                        r,
                        u)
                    },
                    C=0;C<v.length;C++)for(varS=0;S<b.length;S++){
                        varx=b[
                            S
                        ];v[
                            C
                        ][
                            x
                        ]=g
                    }(0,
                    p.getOverlay)().onclick=g,
                    l=e.onkeydown;vark=function(e){
                        return(0,
                        y[
                            "default"
                        ])(e,
                        r,
                        u)
                    };e.onkeydown=k,
                    e.onfocus=function(){
                        setTimeout(function(){
                            i!==n&&(i.focus(),
                            i=n)
                        },
                        0)
                    },
                    c.enableButtons()
                },
                u.setDefaults=c.setDefaults=function(e){
                    if(!e)thrownewError("userParams is required");if("object"!=typeofe)thrownewError("userParams has to be a object");(0,
                    f.extend)(h[
                        "default"
                    ],
                    e)
                },
                u.close=c.close=function(){
                    varo=(0,
                    p.getModal)();(0,
                    d.fadeOut)((0,
                    p.getOverlay)(),
                    5),
                    (0,
                    d.fadeOut)(o,
                    5),
                    (0,
                    d.removeClass)(o,
                    "showSweetAlert"),
                    (0,
                    d.addClass)(o,
                    "hideSweetAlert"),
                    (0,
                    d.removeClass)(o,
                    "visible");vara=o.querySelector(".sa-icon.sa-success");(0,
                    d.removeClass)(a,
                    "animate"),
                    (0,
                    d.removeClass)(a.querySelector(".sa-tip"),
                    "animateSuccessTip"),
                    (0,
                    d.removeClass)(a.querySelector(".sa-long"),
                    "animateSuccessLong");varr=o.querySelector(".sa-icon.sa-error");(0,
                    d.removeClass)(r,
                    "animateErrorIcon"),
                    (0,
                    d.removeClass)(r.querySelector(".sa-x-mark"),
                    "animateXMark");vars=o.querySelector(".sa-icon.sa-warning");return(0,
                    d.removeClass)(s,
                    "pulseWarning"),
                    (0,
                    d.removeClass)(s.querySelector(".sa-body"),
                    "pulseWarningIns"),
                    (0,
                    d.removeClass)(s.querySelector(".sa-dot"),
                    "pulseWarningIns"),
                    setTimeout(function(){
                        vare=o.getAttribute("data-custom-class");(0,
                        d.removeClass)(o,
                        e)
                    },
                    300),
                    (0,
                    d.removeClass)(t.body,
                    "stop-scrolling"),
                    e.onkeydown=l,
                    e.previousActiveElement&&e.previousActiveElement.focus(),
                    i=n,
                    clearTimeout(o.timeout),
                    !0
                },
                u.showInputError=c.showInputError=function(e){
                    vart=(0,
                    p.getModal)(),
                    n=t.querySelector(".sa-input-error");(0,
                    d.addClass)(n,
                    "show");varo=t.querySelector(".sa-error-container");(0,
                    d.addClass)(o,
                    "show"),
                    o.querySelector("p").innerHTML=e,
                    setTimeout(function(){
                        u.enableButtons()
                    },
                    1),
                    t.querySelector("input").focus()
                },
                u.resetInputError=c.resetInputError=function(e){
                    if(e&&13===e.keyCode)return!1;vart=(0,
                    p.getModal)(),
                    n=t.querySelector(".sa-input-error");(0,
                    d.removeClass)(n,
                    "show");varo=t.querySelector(".sa-error-container");(0,
                    d.removeClass)(o,
                    "show")
                },
                u.disableButtons=c.disableButtons=function(e){
                    vart=(0,
                    p.getModal)(),
                    n=t.querySelector("button.confirm"),
                    o=t.querySelector("button.cancel");n.disabled=!0,
                    o.disabled=!0
                },
                u.enableButtons=c.enableButtons=function(e){
                    vart=(0,
                    p.getModal)(),
                    n=t.querySelector("button.confirm"),
                    o=t.querySelector("button.cancel");n.disabled=!1,
                    o.disabled=!1
                },
                "undefined"!=typeofe?e.sweetAlert=e.swal=u: (0,
                f.logStr)("SweetAlert is a frontend module!"),
                a.exports=r[
                    "default"
                ]
            },
            {
                "./modules/default-params": 2,
                "./modules/handle-click": 3,
                "./modules/handle-dom": 4,
                "./modules/handle-key": 5,
                "./modules/handle-swal-dom": 6,
                "./modules/set-params": 8,
                "./modules/utils": 9
            }
        ],
        2: [
            function(e,
            t,
            n){
                Object.defineProperty(n,
                "__esModule",
                {
                    value: !0
                });varo={
                    title: "",
                    text: "",
                    type: null,
                    allowOutsideClick: !1,
                    showConfirmButton: !0,
                    showCancelButton: !1,
                    closeOnConfirm: !0,
                    closeOnCancel: !0,
                    confirmButtonText: "OK",
                    confirmButtonColor: "#8CD4F5",
                    cancelButtonText: "Cancel",
                    imageUrl: null,
                    imageSize: null,
                    timer: null,
                    customClass: "",
                    html: !1,
                    animation: !0,
                    allowEscapeKey: !0,
                    inputType: "text",
                    inputPlaceholder: "",
                    inputValue: "",
                    showLoaderOnConfirm: !1
                };n[
                    "default"
                ]=o,
                t.exports=n[
                    "default"
                ]
            },
            {
                
            }
        ],
        3: [
            function(t,
            n,
            o){
                Object.defineProperty(o,
                "__esModule",
                {
                    value: !0
                });vara=t("./utils"),
                r=(t("./handle-swal-dom"),
                t("./handle-dom")),
                s=function(t,
                n,
                o){
                    functions(e){
                        m&&n.confirmButtonColor&&(p.style.backgroundColor=e)
                    }varu,
                    c,
                    d,
                    f=t||e.event,
                    p=f.target||f.srcElement,
                    m=-1!==p.className.indexOf("confirm"),
                    v=-1!==p.className.indexOf("sweet-overlay"),
                    y=(0,
                    r.hasClass)(o,
                    "visible"),
                    b=n.doneFunction&&"true"===o.getAttribute("data-has-done-function");switch(m&&n.confirmButtonColor&&(u=n.confirmButtonColor,
                    c=(0,
                    a.colorLuminance)(u,
                    -.04),
                    d=(0,
                    a.colorLuminance)(u,
                    -.14)),
                    f.type){
                        case"mouseover": s(c);break;case"mouseout": s(u);break;case"mousedown": s(d);break;case"mouseup": s(c);break;case"focus": varh=o.querySelector("button.confirm"),
                        g=o.querySelector("button.cancel");m?g.style.boxShadow="none": h.style.boxShadow="none";break;case"click": varw=o===p,
                        C=(0,
                        r.isDescendant)(o,
                        p);if(!w&&!C&&y&&!n.allowOutsideClick)break;m&&b&&y?l(o,
                        n): b&&y||v?i(o,
                        n): (0,
                        r.isDescendant)(o,
                        p)&&"BUTTON"===p.tagName&&sweetAlert.close()
                    }
                },
                l=function(e,
                t){
                    varn=!0;(0,
                    r.hasClass)(e,
                    "show-input")&&(n=e.querySelector("input").value,
                    n||(n="")),
                    t.doneFunction(n),
                    t.closeOnConfirm&&sweetAlert.close(),
                    t.showLoaderOnConfirm&&sweetAlert.disableButtons()
                },
                i=function(e,
                t){
                    varn=String(t.doneFunction).replace(/\s/g,
                    ""),
                    o="function("===n.substring(0,
                    9)&&")"!==n.substring(9,
                    10);o&&t.doneFunction(!1),
                    t.closeOnCancel&&sweetAlert.close()
                };o[
                    "default"
                ]={
                    handleButton: s,
                    handleConfirm: l,
                    handleCancel: i
                },
                n.exports=o[
                    "default"
                ]
            },
            {
                "./handle-dom": 4,
                "./handle-swal-dom": 6,
                "./utils": 9
            }
        ],
        4: [
            function(n,
            o,
            a){
                Object.defineProperty(a,
                "__esModule",
                {
                    value: !0
                });varr=function(e,
                t){
                    returnnewRegExp(" "+t+" ").test(" "+e.className+" ")
                },
                s=function(e,
                t){
                    r(e,
                    t)||(e.className+=" "+t)
                },
                l=function(e,
                t){
                    varn=" "+e.className.replace(/[
                        \t\r\n
                    ]/g,
                    " ")+" ";if(r(e,
                    t)){
                        for(;n.indexOf(" "+t+" ")>=0;)n=n.replace(" "+t+" ",
                        " ");e.className=n.replace(/^\s+|\s+$/g,
                        "")
                    }
                },
                i=function(e){
                    varn=t.createElement("div");returnn.appendChild(t.createTextNode(e)),
                    n.innerHTML
                },
                u=function(e){
                    e.style.opacity="",
                    e.style.display="block"
                },
                c=function(e){
                    if(e&&!e.length)returnu(e);for(vart=0;t<e.length;++t)u(e[
                        t
                    ])
                },
                d=function(e){
                    e.style.opacity="",
                    e.style.display="none"
                },
                f=function(e){
                    if(e&&!e.length)returnd(e);for(vart=0;t<e.length;++t)d(e[
                        t
                    ])
                },
                p=function(e,
                t){
                    for(varn=t.parentNode;null!==n;){
                        if(n===e)return!0;n=n.parentNode
                    }return!1
                },
                m=function(e){
                    e.style.left="-9999px",
                    e.style.display="block";vart,
                    n=e.clientHeight;returnt="undefined"!=typeofgetComputedStyle?parseInt(getComputedStyle(e).getPropertyValue("padding-top"),
                    10): parseInt(e.currentStyle.padding),
                    e.style.left="",
                    e.style.display="none",
                    "-"+parseInt((n+t)/2)+"px"
                },
                v=function(e,
                t){
                    if(+e.style.opacity<1){
                        t=t||16,
                        e.style.opacity=0,
                        e.style.display="block";varn=+newDate,
                        o=functiona(){
                            e.style.opacity=+e.style.opacity+(newDate-n)/100,
                            n=+newDate,
                            +e.style.opacity<1&&setTimeout(a,
                            t)
                        };o()
                    }e.style.display="block"
                },
                y=function(e,
                t){
                    t=t||16,
                    e.style.opacity=1;varn=+newDate,
                    o=functiona(){
                        e.style.opacity=+e.style.opacity-(newDate-n)/100,
                        n=+newDate,
                        +e.style.opacity>0?setTimeout(a,
                        t): e.style.display="none"
                    };o()
                },
                b=function(n){
                    if("function"==typeofMouseEvent){
                        varo=newMouseEvent("click",
                        {
                            view: e,
                            bubbles: !1,
                            cancelable: !0
                        });n.dispatchEvent(o)
                    }elseif(t.createEvent){
                        vara=t.createEvent("MouseEvents");a.initEvent("click",
                        !1,
                        !1),
                        n.dispatchEvent(a)
                    }elset.createEventObject?n.fireEvent("onclick"): "function"==typeofn.onclick&&n.onclick()
                },
                h=function(t){
                    "function"==typeoft.stopPropagation?(t.stopPropagation(),
                    t.preventDefault()): e.event&&e.event.hasOwnProperty("cancelBubble")&&(e.event.cancelBubble=!0)
                };a.hasClass=r,
                a.addClass=s,
                a.removeClass=l,
                a.escapeHtml=i,
                a._show=u,
                a.show=c,
                a._hide=d,
                a.hide=f,
                a.isDescendant=p,
                a.getTopMargin=m,
                a.fadeIn=v,
                a.fadeOut=y,
                a.fireClick=b,
                a.stopEventPropagation=h
            },
            {
                
            }
        ],
        5: [
            function(t,
            o,
            a){
                Object.defineProperty(a,
                "__esModule",
                {
                    value: !0
                });varr=t("./handle-dom"),
                s=t("./handle-swal-dom"),
                l=function(t,
                o,
                a){
                    varl=t||e.event,
                    i=l.keyCode||l.which,
                    u=a.querySelector("button.confirm"),
                    c=a.querySelector("button.cancel"),
                    d=a.querySelectorAll("button[tabindex]");if(-1!==[
                        9,
                        13,
                        32,
                        27
                    ].indexOf(i)){
                        for(varf=l.target||l.srcElement,
                        p=-1,
                        m=0;m<d.length;m++)if(f===d[
                            m
                        ]){
                            p=m;break
                        }9===i?(f=-1===p?u: p===d.length-1?d[
                            0
                        ]: d[
                            p+1
                        ],
                        (0,
                        r.stopEventPropagation)(l),
                        f.focus(),
                        o.confirmButtonColor&&(0,
                        s.setFocusStyle)(f,
                        o.confirmButtonColor)): 13===i?("INPUT"===f.tagName&&(f=u,
                        u.focus()),
                        f=-1===p?u: n): 27===i&&o.allowEscapeKey===!0?(f=c,
                        (0,
                        r.fireClick)(f,
                        l)): f=n
                    }
                };a[
                    "default"
                ]=l,
                o.exports=a[
                    "default"
                ]
            },
            {
                "./handle-dom": 4,
                "./handle-swal-dom": 6
            }
        ],
        6: [
            function(n,
            o,
            a){
                functionr(e){
                    returne&&e.__esModule?e: {
                        "default": e
                    }
                }Object.defineProperty(a,
                "__esModule",
                {
                    value: !0
                });vars=n("./utils"),
                l=n("./handle-dom"),
                i=n("./default-params"),
                u=r(i),
                c=n("./injected-html"),
                d=r(c),
                f=".sweet-alert",
                p=".sweet-overlay",
                m=function(){
                    vare=t.createElement("div");for(e.innerHTML=d[
                        "default"
                    ];e.firstChild;)t.body.appendChild(e.firstChild)
                },
                v=functionx(){
                    vare=t.querySelector(f);returne||(m(),
                    e=x()),
                    e
                },
                y=function(){
                    vare=v();returne?e.querySelector("input"): void0
                },
                b=function(){
                    returnt.querySelector(p)
                },
                h=function(e,
                t){
                    varn=(0,
                    s.hexToRgb)(t);e.style.boxShadow="0 0 2px rgba("+n+", 0.8), inset 0 0 0 1px rgba(0, 0, 0, 0.05)"
                },
                g=function(n){
                    varo=v();(0,
                    l.fadeIn)(b(),
                    10),
                    (0,
                    l.show)(o),
                    (0,
                    l.addClass)(o,
                    "showSweetAlert"),
                    (0,
                    l.removeClass)(o,
                    "hideSweetAlert"),
                    e.previousActiveElement=t.activeElement;vara=o.querySelector("button.confirm");a.focus(),
                    setTimeout(function(){
                        (0,
                        l.addClass)(o,
                        "visible")
                    },
                    500);varr=o.getAttribute("data-timer");if("null"!==r&&""!==r){
                        vars=n;o.timeout=setTimeout(function(){
                            vare=(s||null)&&"true"===o.getAttribute("data-has-done-function");e?s(null): sweetAlert.close()
                        },
                        r)
                    }
                },
                w=function(){
                    vare=v(),
                    t=y();(0,
                    l.removeClass)(e,
                    "show-input"),
                    t.value=u[
                        "default"
                    ].inputValue,
                    t.setAttribute("type",
                    u[
                        "default"
                    ].inputType),
                    t.setAttribute("placeholder",
                    u[
                        "default"
                    ].inputPlaceholder),
                    C()
                },
                C=function(e){
                    if(e&&13===e.keyCode)return!1;vart=v(),
                    n=t.querySelector(".sa-input-error");(0,
                    l.removeClass)(n,
                    "show");varo=t.querySelector(".sa-error-container");(0,
                    l.removeClass)(o,
                    "show")
                },
                S=function(){
                    vare=v();e.style.marginTop=(0,
                    l.getTopMargin)(v())
                };a.sweetAlertInitialize=m,
                a.getModal=v,
                a.getOverlay=b,
                a.getInput=y,
                a.setFocusStyle=h,
                a.openModal=g,
                a.resetInput=w,
                a.resetInputError=C,
                a.fixVerticalPosition=S
            },
            {
                "./default-params": 2,
                "./handle-dom": 4,
                "./injected-html": 7,
                "./utils": 9
            }
        ],
        7: [
            function(e,
            t,
            n){
                Object.defineProperty(n,
                "__esModule",
                {
                    value: !0
                });varo='<divclass="sweet-overlay"tabIndex="-1"></div><divclass="sweet-alert"><divclass="sa-icon sa-error">\n<spanclass="sa-x-mark">\n<spanclass="sa-line sa-left"></span>\n<spanclass="sa-line sa-right"></span>\n</span>\n</div><divclass="sa-icon sa-warning">\n<spanclass="sa-body"></span>\n<spanclass="sa-dot"></span>\n</div><divclass="sa-icon sa-info"></div><divclass="sa-icon sa-success">\n<spanclass="sa-line sa-tip"></span>\n<spanclass="sa-line sa-long"></span>\n\n<divclass="sa-placeholder"></div>\n<divclass="sa-fix"></div>\n</div><divclass="sa-icon sa-custom"></div><h2>Title</h2>\n<p>Text</p>\n<fieldset>\n<inputtype="text"tabIndex="3"/>\n<divclass="sa-input-error"></div>\n</fieldset><divclass="sa-error-container">\n<divclass="icon">!</div>\n<p>Notvalid!</p>\n</div><divclass="sa-button-container">\n<buttonclass="cancel"tabIndex="2">Cancel</button>\n<divclass="sa-confirm-button-container">\n<buttonclass="confirm"tabIndex="1">OK</button><divclass="la-ball-fall">\n<div></div>\n<div></div>\n<div></div>\n</div>\n</div>\n</div></div>';n[
                    "default"
                ]=o,
                t.exports=n[
                    "default"
                ]
            },
            {
                
            }
        ],
        8: [
            function(e,
            t,
            o){
                Object.defineProperty(o,
                "__esModule",
                {
                    value: !0
                });vara=e("./utils"),
                r=e("./handle-swal-dom"),
                s=e("./handle-dom"),
                l=[
                    "error",
                    "warning",
                    "info",
                    "success",
                    "input",
                    "prompt"
                ],
                i=function(e){
                    vart=(0,
                    r.getModal)(),
                    o=t.querySelector("h2"),
                    i=t.querySelector("p"),
                    u=t.querySelector("button.cancel"),
                    c=t.querySelector("button.confirm");if(o.innerHTML=e.html?e.title: (0,
                    s.escapeHtml)(e.title).split("\n").join("<br>"),
                    i.innerHTML=e.html?e.text: (0,
                    s.escapeHtml)(e.text||"").split("\n").join("<br>"),
                    e.text&&(0,
                    s.show)(i),
                    e.customClass)(0,
                    s.addClass)(t,
                    e.customClass),
                    t.setAttribute("data-custom-class",
                    e.customClass);else{
                        vard=t.getAttribute("data-custom-class");(0,
                        s.removeClass)(t,
                        d),
                        t.setAttribute("data-custom-class",
                        "")
                    }if((0,
                    s.hide)(t.querySelectorAll(".sa-icon")),
                    e.type&&!(0,
                    a.isIE8)()){
                        varf=function(){
                            for(varo=!1,
                            a=0;a<l.length;a++)if(e.type===l[
                                a
                            ]){
                                o=!0;break
                            }if(!o)returnlogStr("Unknown alert type: "+e.type),
                            {
                                v: !1
                            };vari=[
                                "success",
                                "error",
                                "warning",
                                "info"
                            ],
                            u=n;-1!==i.indexOf(e.type)&&(u=t.querySelector(".sa-icon.sa-"+e.type),
                            (0,
                            s.show)(u));varc=(0,
                            r.getInput)();switch(e.type){
                                case"success": (0,
                                s.addClass)(u,
                                "animate"),
                                (0,
                                s.addClass)(u.querySelector(".sa-tip"),
                                "animateSuccessTip"),
                                (0,
                                s.addClass)(u.querySelector(".sa-long"),
                                "animateSuccessLong");break;case"error": (0,
                                s.addClass)(u,
                                "animateErrorIcon"),
                                (0,
                                s.addClass)(u.querySelector(".sa-x-mark"),
                                "animateXMark");break;case"warning": (0,
                                s.addClass)(u,
                                "pulseWarning"),
                                (0,
                                s.addClass)(u.querySelector(".sa-body"),
                                "pulseWarningIns"),
                                (0,
                                s.addClass)(u.querySelector(".sa-dot"),
                                "pulseWarningIns");break;case"input": case"prompt": c.setAttribute("type",
                                e.inputType),
                                c.value=e.inputValue,
                                c.setAttribute("placeholder",
                                e.inputPlaceholder),
                                (0,
                                s.addClass)(t,
                                "show-input"),
                                setTimeout(function(){
                                    c.focus(),
                                    c.addEventListener("keyup",
                                    swal.resetInputError)
                                },
                                400)
                            }
                        }();if("object"==typeoff)returnf.v
                    }if(e.imageUrl){
                        varp=t.querySelector(".sa-icon.sa-custom");p.style.backgroundImage="url("+e.imageUrl+")",
                        (0,
                        s.show)(p);varm=80,
                        v=80;if(e.imageSize){
                            vary=e.imageSize.toString().split("x"),
                            b=y[
                                0
                            ],
                            h=y[
                                1
                            ];b&&h?(m=b,
                            v=h): logStr("Parameter imageSize expects value with format WIDTHxHEIGHT, got "+e.imageSize)
                        }p.setAttribute("style",
                        p.getAttribute("style")+"width:"+m+"px; height:"+v+"px")
                    }t.setAttribute("data-has-cancel-button",
                    e.showCancelButton),
                    e.showCancelButton?u.style.display="inline-block": (0,
                    s.hide)(u),
                    t.setAttribute("data-has-confirm-button",
                    e.showConfirmButton),
                    e.showConfirmButton?c.style.display="inline-block": (0,
                    s.hide)(c),
                    e.cancelButtonText&&(u.innerHTML=(0,
                    s.escapeHtml)(e.cancelButtonText)),
                    e.confirmButtonText&&(c.innerHTML=(0,
                    s.escapeHtml)(e.confirmButtonText)),
                    e.confirmButtonColor&&(c.style.backgroundColor=e.confirmButtonColor,
                    c.style.borderLeftColor=e.confirmLoadingButtonColor,
                    c.style.borderRightColor=e.confirmLoadingButtonColor,
                    (0,
                    r.setFocusStyle)(c,
                    e.confirmButtonColor)),
                    t.setAttribute("data-allow-outside-click",
                    e.allowOutsideClick);varg=!!e.doneFunction;t.setAttribute("data-has-done-function",
                    g),
                    e.animation?"string"==typeofe.animation?t.setAttribute("data-animation",
                    e.animation): t.setAttribute("data-animation",
                    "pop"): t.setAttribute("data-animation",
                    "none"),
                    t.setAttribute("data-timer",
                    e.timer)
                };o[
                    "default"
                ]=i,
                t.exports=o[
                    "default"
                ]
            },
            {
                "./handle-dom": 4,
                "./handle-swal-dom": 6,
                "./utils": 9
            }
        ],
        9: [
            function(t,
            n,
            o){
                Object.defineProperty(o,
                "__esModule",
                {
                    value: !0
                });vara=function(e,
                t){
                    for(varnint)t.hasOwnProperty(n)&&(e[
                        n
                    ]=t[
                        n
                    ]);returne
                },
                r=function(e){
                    vart=/^#?([
                        a-f\d
                    ]{
                        2
                    })([
                        a-f\d
                    ]{
                        2
                    })([
                        a-f\d
                    ]{
                        2
                    })$/i.exec(e);returnt?parseInt(t[
                        1
                    ],
                    16)+", "+parseInt(t[
                        2
                    ],
                    16)+", "+parseInt(t[
                        3
                    ],
                    16): null
                },
                s=function(){
                    returne.attachEvent&&!e.addEventListener
                },
                l=function(t){
                    "undefined"!=typeofe&&e.console&&e.console.log("SweetAlert: "+t)
                },
                i=function(e,
                t){
                    e=String(e).replace(/[
                        ^0-9a-f
                    ]/gi,
                    ""),
                    e.length<6&&(e=e[
                        0
                    ]+e[
                        0
                    ]+e[
                        1
                    ]+e[
                        1
                    ]+e[
                        2
                    ]+e[
                        2
                    ]),
                    t=t||0;varn,
                    o,
                    a="#";for(o=0;3>o;o++)n=parseInt(e.substr(2*o,
                    2),
                    16),
                    n=Math.round(Math.min(Math.max(0,
                    n+n*t),
                    255)).toString(16),
                    a+=("00"+n).substr(n.length);returna
                };o.extend=a,
                o.hexToRgb=r,
                o.isIE8=s,
                o.logStr=l,
                o.colorLuminance=i
            },
            {
                
            }
        ]
    },
    {
        
    },
    [
        1
    ]),
    "function"==typeofdefine&&define.amd?define(function(){
        returnsweetAlert
    }): "undefined"!=typeofmodule&&module.exports&&(module.exports=sweetAlert)
}(window,
document);