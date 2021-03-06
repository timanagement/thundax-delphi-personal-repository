//  Copyright (c) 2012-2013, Jordi Corbilla
//  All rights reserved.
//
//  Redistribution and use in source and binary forms, with or without
//  modification, are permitted provided that the following conditions are met:
//
//  - Redistributions of source code must retain the above copyright notice,
//    this list of conditions and the following disclaimer.
//  - Redistributions in binary form must reproduce the above copyright notice,
//    this list of conditions and the following disclaimer in the documentation
//    and/or other materials provided with the distribution.
//  - Neither the name of this library nor the names of its contributors may be
//    used to endorse or promote products derived from this software without
//    specific prior written permission.
//
//  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
//  AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
//  IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
//  ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
//  LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
//  CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
//  SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
//  INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
//  CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
//  ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
//  POSSIBILITY OF SUCH DAMAGE.

unit Testthundax.RegularExpressions;
{

  Delphi DUnit Test Case
  ----------------------
  This unit contains a skeleton test case class generated by the Test Case Wizard.
  Modify the generated code to correctly setup and call the methods from the unit 
  being tested.

}

interface

uses
  TestFramework, thundax.stringHelper;

type
  TestTStringHelper = class(TTestCase)
  public
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestLeftRightString;
    procedure TestIsMatchRegularExpression;
    procedure TestGroupsRegularExpression;
  end;

implementation

uses
  RegularExpressions;

procedure TestTStringHelper.SetUp;
begin
//
end;

procedure TestTStringHelper.TearDown;
begin
//
end;

procedure TestTStringHelper.TestGroupsRegularExpression;
var
  ReturnValue: Integer;
  text: string;
  group : TGroup;
begin
  text := 'ABABABGHIJKL';
  ReturnValue := 0;
  for group in  TStringHelper.New(text).Left(6).Right(4).MatchGroups('(AB)') do
    inc(ReturnValue);
  CheckTrue(ReturnValue=2, 'ReturnValue does not match');
end;

procedure TestTStringHelper.TestIsMatchRegularExpression;
var
  ReturnValue: boolean;
  text: string;
begin
  text := 'ABCDEFGHIJKL';
  ReturnValue := TStringHelper.New(text).Left(3).Right(1).isMatch('[A-Z]');
  CheckTrue(ReturnValue, 'ReturnValue does not match');
end;

procedure TestTStringHelper.TestLeftRightString;
var
  ReturnValue: string;
  text: string;
begin
  text := 'ABCDEFGHIJKL';
  ReturnValue := TStringHelper.New(text).Left(3).Right(1).toString();
  CheckTrue(ReturnValue = 'C', 'ReturnValue does not return desired value');
end;

initialization
  RegisterTest(TestTStringHelper.Suite);
end.

