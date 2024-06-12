import { Component, OnInit } from "@angular/core";
import { Router } from "@angular/router";

import {
  FormBuilder,
  FormControl,
  FormGroup,
  Validators,
} from "@angular/forms";
import { MatDialog } from "@angular/material/dialog";
import {
  HttpClient,
  HttpClientModule,
  HttpHeaders,
} from "@angular/common/http";
//import { Seg_LoginService } from "./../../core/seg/seg_login/service/Seg_login.service";
import { Seg_LoginService } from "app/core/seg/seg_login/service/Seg_login.service";
//import { Seg_loginModel } from "./../../core/seg/seg_login/model/Seg_login.model";
import { Seg_loginModel } from "app/core/seg/seg_login/model/Seg_login.model";
//import { SwMsgService } from "app/core/swmsg/service/swmsg.service";
import { SwMsgservice } from "./../../../app/core/swmsg/service/swmsg.service";


@Component({
  selector: "app-login",
  templateUrl: "./login.component.html",
  styleUrls: ["./login.component.scss"],
})
export class LoginComponent implements OnInit {
  
  public searchfilter: any;
  constructor(
    private router: Router,
    private fb: FormBuilder,
    private http: HttpClient,
    private loginService: Seg_LoginService,
    public dialog: MatDialog,
    private swMsgService: SwMsgservice
  ) {
    this.searchfilter = {
      draw: 1,
      start: 0,
      length: 12,
      correo_electronico: "",
      password: "",
    };
  }

  ngOnInit() {}

  onLogin() {
    var ays = new Seg_loginModel();
    ays.email = this.searchfilter.correo_electronico;
    ays.psw = this.searchfilter.password;
    this.loginService.login(ays, (data) => {
      console.log(data);
      if (data["NRO"] > 0) {
        if (data["DATA"][0]["cod_usu"]) {
          sessionStorage.setItem("isLoggedin", "true");
          sessionStorage.setItem("username", data["DATA"][0]["cod_usu"]);
          sessionStorage.setItem("email", data["DATA"][0]["email"]);
          sessionStorage.setItem("token", data["TOKEN"]);
          this.router.navigate(["/dashboard"]);
        } else {
          this.handleError("Usuario o contraseña no valido");
        }
      } else {
        this.handleError("Usuario o contraseña no valido");
      }
    });
  }

  // varios
  openInfoModal() {
    this.swMsgService.opeSuccesModal();
  }
  private success() {
    this.swMsgService.opeSuccesModal();
  }
  private handleError(error: any) {
    this.swMsgService.opeErrorModal();
  }
}