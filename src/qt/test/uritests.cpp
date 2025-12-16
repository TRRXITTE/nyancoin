// Copyright (c) 2009-2014 The Bitcoin Core developers
// Distributed under the MIT software license, see the accompanying
// file COPYING or http://www.opensource.org/licenses/mit-license.php.

#include "uritests.h"

#include "guiutil.h"
#include "walletmodel.h"

#include <QUrl>

void URITests::uriTests()
{
    SendCoinsRecipient rv;
    QUrl uri;
    uri.setUrl(QString("nintondo:NKuyBkoGdZZSLyPbJEetheRhMjeznFZszf?req-dontexist="));
    QVERIFY(!GUIUtil::parseBitcoinURI(uri, &rv));

    uri.setUrl(QString("nintondo:NKuyBkoGdZZSLyPbJEetheRhMjeznFZszf?dontexist="));
    QVERIFY(GUIUtil::parseBitcoinURI(uri, &rv));
    QVERIFY(rv.address == QString("NKuyBkoGdZZSLyPbJEetheRhMjeznFZszf"));
    QVERIFY(rv.label == QString());
    QVERIFY(rv.amount == 0);

    uri.setUrl(QString("nintondo:NKuyBkoGdZZSLyPbJEetheRhMjeznFZszf?label=Wikipedia Example Address"));
    QVERIFY(GUIUtil::parseBitcoinURI(uri, &rv));
    QVERIFY(rv.address == QString("NKuyBkoGdZZSLyPbJEetheRhMjeznFZszf"));
    QVERIFY(rv.label == QString("Wikipedia Example Address"));
    QVERIFY(rv.amount == 0);

    uri.setUrl(QString("nintondo:NKuyBkoGdZZSLyPbJEetheRhMjeznFZszf?amount=0.001"));
    QVERIFY(GUIUtil::parseBitcoinURI(uri, &rv));
    QVERIFY(rv.address == QString("NKuyBkoGdZZSLyPbJEetheRhMjeznFZszf"));
    QVERIFY(rv.label == QString());
    QVERIFY(rv.amount == 100000);

    uri.setUrl(QString("nintondo:NKuyBkoGdZZSLyPbJEetheRhMjeznFZszf?amount=1.001"));
    QVERIFY(GUIUtil::parseBitcoinURI(uri, &rv));
    QVERIFY(rv.address == QString("NKuyBkoGdZZSLyPbJEetheRhMjeznFZszf"));
    QVERIFY(rv.label == QString());
    QVERIFY(rv.amount == 100100000);

    uri.setUrl(QString("nintondo:NKuyBkoGdZZSLyPbJEetheRhMjeznFZszf?amount=100&label=Wikipedia Example"));
    QVERIFY(GUIUtil::parseBitcoinURI(uri, &rv));
    QVERIFY(rv.address == QString("NKuyBkoGdZZSLyPbJEetheRhMjeznFZszf"));
    QVERIFY(rv.amount == 10000000000LL);
    QVERIFY(rv.label == QString("Wikipedia Example"));

    uri.setUrl(QString("nintondo:NKuyBkoGdZZSLyPbJEetheRhMjeznFZszf?message=Wikipedia Example Address"));
    QVERIFY(GUIUtil::parseBitcoinURI(uri, &rv));
    QVERIFY(rv.address == QString("NKuyBkoGdZZSLyPbJEetheRhMjeznFZszf"));
    QVERIFY(rv.label == QString());

    QVERIFY(GUIUtil::parseBitcoinURI("nintondo://NKuyBkoGdZZSLyPbJEetheRhMjeznFZszf?message=Wikipedia Example Address", &rv));
    QVERIFY(rv.address == QString("NKuyBkoGdZZSLyPbJEetheRhMjeznFZszf"));
    QVERIFY(rv.label == QString());

    uri.setUrl(QString("nintondo:NKuyBkoGdZZSLyPbJEetheRhMjeznFZszf?req-message=Wikipedia Example Address"));
    QVERIFY(GUIUtil::parseBitcoinURI(uri, &rv));

    uri.setUrl(QString("nintondo:NKuyBkoGdZZSLyPbJEetheRhMjeznFZszf?amount=1,000&label=Wikipedia Example"));
    QVERIFY(!GUIUtil::parseBitcoinURI(uri, &rv));

    uri.setUrl(QString("nintondo:NKuyBkoGdZZSLyPbJEetheRhMjeznFZszf?amount=1,000.0&label=Wikipedia Example"));
    QVERIFY(!GUIUtil::parseBitcoinURI(uri, &rv));
}
