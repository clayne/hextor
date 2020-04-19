{                          ---BEGIN LICENSE BLOCK---                           }
{                                                                              }
{ Hextor - Hexadecimal editor and binary data analyzing toolkit                }
{ Copyright (C) 2019-2020  Grigoriy Mylnikov (DigitalWolF) <info@hextor.net>   }
{ Hextor is a Freeware Source-Available software. See LICENSE.txt for details  }
{                                                                              }
{                           ---END LICENSE BLOCK---                            }

unit uCallbackList;

interface

type
  // Multiple-subscriber callback mechanism
  // (inspired by signal-slot in Qt)
  // Implemented as record so no need to explicitly call constructor

  TCallbackListP1<T1> = record
  public type
    TCallback = reference to procedure(Param1: T1);
  private
    FList: array of TCallback;
  public
    procedure Add(Method: TCallback);
    procedure Remove(Method: TCallback);
    procedure Call(Param1: T1);
  end;

  TCallbackListP2<T1, T2> = record
  public type
    TCallback = reference to procedure(Param1: T1; Param2: T2);
  private
    FList: array of TCallback;
  public
    procedure Add(Method: TCallback);
    procedure Remove(Method: TCallback);
    procedure Call(Param1: T1; Param2: T2);
  end;

  TCallbackListP3<T1, T2, T3> = record
  public type
    TCallback = reference to procedure(Param1: T1; Param2: T2; Param3: T3);
  private
    FList: array of TCallback;
  public
    procedure Add(Method: TCallback);
    procedure Remove(Method: TCallback);
    procedure Call(Param1: T1; Param2: T2; Param3: T3);
  end;

  TCallbackListP4<T1, T2, T3, T4> = record
  public type
    TCallback = reference to procedure(Param1: T1; Param2: T2; Param3: T3; Param4: T4);
  private
    FList: array of TCallback;
  public
    procedure Add(Method: TCallback);
    procedure Remove(Method: TCallback);
    procedure Call(Param1: T1; Param2: T2; Param3: T3; Param4: T4);
  end;


implementation

{ TCallbackListP1<T1> }

procedure TCallbackListP1<T1>.Add(Method: TCallback);
begin
  FList := FList + [TCallback(Method)];
end;

procedure TCallbackListP1<T1>.Call(Param1: T1);
var
  i: Integer;
begin
  for i:=0 to Length(FList)-1 do
    FList[i](Param1);
end;

procedure TCallbackListP1<T1>.Remove(Method: TCallback);
var
  i: Integer;
begin
  for i:=Length(FList)-1 downto 0 do
    if TCallback(FList[i]) = TCallback(Method) then
      Delete(FList, i, 1);
end;

{ TCallbackListP2<T1, T2> }

procedure TCallbackListP2<T1, T2>.Add(Method: TCallback);
begin
  FList := FList + [TCallback(Method)];
end;

procedure TCallbackListP2<T1, T2>.Call(Param1: T1; Param2: T2);
var
  i: Integer;
begin
  for i:=0 to Length(FList)-1 do
    FList[i](Param1, Param2);
end;

procedure TCallbackListP2<T1, T2>.Remove(Method: TCallback);
var
  i: Integer;
begin
  for i:=Length(FList)-1 downto 0 do
    if TCallback(FList[i]) = TCallback(Method) then
      Delete(FList, i, 1);
end;

{ TCallbackListP3<T1, T2, T3> }

procedure TCallbackListP3<T1, T2, T3>.Add(Method: TCallback);
begin
  FList := FList + [TCallback(Method)];
end;

procedure TCallbackListP3<T1, T2, T3>.Call(Param1: T1; Param2: T2; Param3: T3);
var
  i: Integer;
begin
  for i:=0 to Length(FList)-1 do
    FList[i](Param1, Param2, Param3);
end;

procedure TCallbackListP3<T1, T2, T3>.Remove(Method: TCallback);
var
  i: Integer;
begin
  for i:=Length(FList)-1 downto 0 do
    if TCallback(FList[i]) = TCallback(Method) then
      Delete(FList, i, 1);
end;

{ TCallbackListP4<T1, T2, T3> }

procedure TCallbackListP4<T1, T2, T3, T4>.Add(Method: TCallback);
begin
  FList := FList + [TCallback(Method)];
end;

procedure TCallbackListP4<T1, T2, T3, T4>.Call(Param1: T1; Param2: T2; Param3: T3; Param4: T4);
var
  i: Integer;
begin
  for i:=0 to Length(FList)-1 do
    FList[i](Param1, Param2, Param3, Param4);
end;

procedure TCallbackListP4<T1, T2, T3, T4>.Remove(Method: TCallback);
var
  i: Integer;
begin
  for i:=Length(FList)-1 downto 0 do
    if TCallback(FList[i]) = TCallback(Method) then
      Delete(FList, i, 1);
end;

end.