import {NgModule} from '@angular/core';
import{CommonModule} from '@angular/common';
import{Seg_moduloService} from './seg/seg_modulo/service/Seg_modulo.service';
import { SwMsgservice } from './swmsg/service/swmsg.service';
import { Seg_aplicacionService } from './seg_aplicacion/service/seg_aplicacion.service';
import { Seg_LoginService } from './seg/seg_login/service/Seg_login.service';


@NgModule({
    declarations:[],
    imports: [
        CommonModule
    ],
    providers:[
        Seg_moduloService,SwMsgservice,Seg_aplicacionService,Seg_LoginService
    ]

})
export class CoreModule{}