-- CreateTable
CREATE TABLE "User" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL DEFAULT '',
    "email" TEXT NOT NULL DEFAULT '',
    "password" TEXT NOT NULL,
    "role" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "passwordResetToken" TEXT,
    "passwordResetIssuedAt" TIMESTAMP(3),
    "passwordResetRedeemedAt" TIMESTAMP(3),

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "apiKey" (
    "id" TEXT NOT NULL,
    "user" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "apiKey_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Role" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL DEFAULT '',
    "canSeeOtherUsers" BOOLEAN NOT NULL DEFAULT false,
    "canManageUsers" BOOLEAN NOT NULL DEFAULT false,
    "canManageRoles" BOOLEAN NOT NULL DEFAULT false,
    "canSeeOtherOrders" BOOLEAN NOT NULL DEFAULT false,
    "canManageOrders" BOOLEAN NOT NULL DEFAULT false,
    "canSeeOtherShops" BOOLEAN NOT NULL DEFAULT false,
    "canManageShops" BOOLEAN NOT NULL DEFAULT false,
    "canSeeOtherChannels" BOOLEAN NOT NULL DEFAULT false,
    "canManageChannels" BOOLEAN NOT NULL DEFAULT false,
    "canSeeOtherMatches" BOOLEAN NOT NULL DEFAULT false,
    "canManageMatches" BOOLEAN NOT NULL DEFAULT false,
    "canSeeOtherLinks" BOOLEAN NOT NULL DEFAULT false,
    "canManageLinks" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "Role_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Order" (
    "id" TEXT NOT NULL,
    "orderId" DOUBLE PRECISION,
    "orderName" TEXT NOT NULL DEFAULT '',
    "email" TEXT NOT NULL DEFAULT '',
    "first_name" TEXT NOT NULL DEFAULT '',
    "last_name" TEXT NOT NULL DEFAULT '',
    "streetAddress1" TEXT NOT NULL DEFAULT '',
    "streetAddress2" TEXT NOT NULL DEFAULT '',
    "city" TEXT NOT NULL DEFAULT '',
    "state" TEXT NOT NULL DEFAULT '',
    "zip" TEXT NOT NULL DEFAULT '',
    "currency" TEXT NOT NULL DEFAULT '',
    "totalPrice" TEXT NOT NULL DEFAULT '',
    "subTotalPrice" TEXT NOT NULL DEFAULT '',
    "totalDiscount" TEXT NOT NULL DEFAULT '',
    "totalTax" TEXT NOT NULL DEFAULT '',
    "phoneNumber" TEXT NOT NULL DEFAULT '',
    "note" TEXT NOT NULL DEFAULT '',
    "shippingMethod" JSONB,
    "country" TEXT NOT NULL DEFAULT '',
    "orderError" TEXT NOT NULL DEFAULT '',
    "status" TEXT NOT NULL DEFAULT '',
    "locationId" DOUBLE PRECISION,
    "user" TEXT,
    "shop" TEXT,
    "linkOrder" BOOLEAN NOT NULL DEFAULT false,
    "matchOrder" BOOLEAN NOT NULL DEFAULT false,
    "processOrder" BOOLEAN NOT NULL DEFAULT false,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Order_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "TrackingDetail" (
    "id" TEXT NOT NULL,
    "trackingCompany" TEXT NOT NULL DEFAULT '',
    "trackingNumber" TEXT NOT NULL DEFAULT '',
    "purchaseId" TEXT NOT NULL DEFAULT '',
    "user" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "TrackingDetail_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "LineItem" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL DEFAULT '',
    "image" TEXT NOT NULL DEFAULT '',
    "price" TEXT NOT NULL DEFAULT '',
    "quantity" INTEGER,
    "productId" TEXT NOT NULL DEFAULT '',
    "variantId" TEXT NOT NULL DEFAULT '',
    "sku" TEXT NOT NULL DEFAULT '',
    "lineItemId" TEXT NOT NULL DEFAULT '',
    "order" TEXT,
    "user" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "LineItem_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "CartItem" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL DEFAULT '',
    "image" TEXT NOT NULL DEFAULT '',
    "price" TEXT NOT NULL DEFAULT '',
    "quantity" INTEGER,
    "productId" TEXT NOT NULL DEFAULT '',
    "variantId" TEXT NOT NULL DEFAULT '',
    "lineItemId" TEXT NOT NULL DEFAULT '',
    "sku" TEXT NOT NULL DEFAULT '',
    "url" TEXT NOT NULL DEFAULT '',
    "error" TEXT NOT NULL DEFAULT '',
    "purchaseId" TEXT NOT NULL DEFAULT '',
    "status" TEXT NOT NULL DEFAULT '',
    "order" TEXT,
    "user" TEXT,
    "channel" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "CartItem_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Channel" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL DEFAULT '',
    "type" TEXT NOT NULL DEFAULT '',
    "domain" TEXT NOT NULL DEFAULT '',
    "accessToken" TEXT NOT NULL DEFAULT '',
    "searchProductsEndpoint" TEXT NOT NULL DEFAULT '',
    "createPurchaseEndpoint" TEXT NOT NULL DEFAULT '',
    "getWebhooksEndpoint" TEXT NOT NULL DEFAULT '',
    "createWebhookEndpoint" TEXT NOT NULL DEFAULT '',
    "deleteWebhookEndpoint" TEXT NOT NULL DEFAULT '',
    "user" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Channel_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ChannelMetafield" (
    "id" TEXT NOT NULL,
    "key" TEXT NOT NULL DEFAULT '',
    "value" TEXT NOT NULL DEFAULT '',
    "channel" TEXT,
    "user" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "ChannelMetafield_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ChannelItem" (
    "id" TEXT NOT NULL,
    "quantity" INTEGER,
    "productId" TEXT NOT NULL DEFAULT '',
    "variantId" TEXT NOT NULL DEFAULT '',
    "lineItemId" TEXT NOT NULL DEFAULT '',
    "price" TEXT NOT NULL DEFAULT '',
    "channel" TEXT,
    "user" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "ChannelItem_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Shop" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL DEFAULT '',
    "type" TEXT NOT NULL DEFAULT '',
    "domain" TEXT NOT NULL DEFAULT '',
    "accessToken" TEXT NOT NULL DEFAULT '',
    "searchProductsEndpoint" TEXT NOT NULL DEFAULT '',
    "searchOrdersEndpoint" TEXT NOT NULL DEFAULT '',
    "updateProductEndpoint" TEXT NOT NULL DEFAULT '',
    "getWebhooksEndpoint" TEXT NOT NULL DEFAULT '',
    "createWebhookEndpoint" TEXT NOT NULL DEFAULT '',
    "deleteWebhookEndpoint" TEXT NOT NULL DEFAULT '',
    "user" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Shop_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ShopMetafield" (
    "id" TEXT NOT NULL,
    "key" TEXT NOT NULL DEFAULT '',
    "value" TEXT NOT NULL DEFAULT '',
    "shop" TEXT,
    "user" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "ShopMetafield_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ShopItem" (
    "id" TEXT NOT NULL,
    "quantity" INTEGER,
    "productId" TEXT NOT NULL DEFAULT '',
    "variantId" TEXT NOT NULL DEFAULT '',
    "lineItemId" TEXT NOT NULL DEFAULT '',
    "shop" TEXT,
    "user" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "ShopItem_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Match" (
    "id" TEXT NOT NULL,
    "user" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Match_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Link" (
    "id" TEXT NOT NULL,
    "shop" TEXT,
    "channel" TEXT,
    "filter" JSONB,
    "user" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Link_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_CartItem_trackingDetails" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "_ChannelItem_matches" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "_Match_input" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");

-- CreateIndex
CREATE INDEX "User_role_idx" ON "User"("role");

-- CreateIndex
CREATE INDEX "apiKey_user_idx" ON "apiKey"("user");

-- CreateIndex
CREATE INDEX "Order_user_idx" ON "Order"("user");

-- CreateIndex
CREATE INDEX "Order_shop_idx" ON "Order"("shop");

-- CreateIndex
CREATE INDEX "TrackingDetail_user_idx" ON "TrackingDetail"("user");

-- CreateIndex
CREATE INDEX "LineItem_order_idx" ON "LineItem"("order");

-- CreateIndex
CREATE INDEX "LineItem_user_idx" ON "LineItem"("user");

-- CreateIndex
CREATE INDEX "CartItem_order_idx" ON "CartItem"("order");

-- CreateIndex
CREATE INDEX "CartItem_user_idx" ON "CartItem"("user");

-- CreateIndex
CREATE INDEX "CartItem_channel_idx" ON "CartItem"("channel");

-- CreateIndex
CREATE INDEX "Channel_user_idx" ON "Channel"("user");

-- CreateIndex
CREATE INDEX "ChannelMetafield_channel_idx" ON "ChannelMetafield"("channel");

-- CreateIndex
CREATE INDEX "ChannelMetafield_user_idx" ON "ChannelMetafield"("user");

-- CreateIndex
CREATE INDEX "ChannelItem_channel_idx" ON "ChannelItem"("channel");

-- CreateIndex
CREATE INDEX "ChannelItem_user_idx" ON "ChannelItem"("user");

-- CreateIndex
CREATE UNIQUE INDEX "Shop_domain_key" ON "Shop"("domain");

-- CreateIndex
CREATE INDEX "Shop_user_idx" ON "Shop"("user");

-- CreateIndex
CREATE INDEX "ShopMetafield_shop_idx" ON "ShopMetafield"("shop");

-- CreateIndex
CREATE INDEX "ShopMetafield_user_idx" ON "ShopMetafield"("user");

-- CreateIndex
CREATE INDEX "ShopItem_shop_idx" ON "ShopItem"("shop");

-- CreateIndex
CREATE INDEX "ShopItem_user_idx" ON "ShopItem"("user");

-- CreateIndex
CREATE INDEX "Match_user_idx" ON "Match"("user");

-- CreateIndex
CREATE INDEX "Link_shop_idx" ON "Link"("shop");

-- CreateIndex
CREATE INDEX "Link_channel_idx" ON "Link"("channel");

-- CreateIndex
CREATE INDEX "Link_user_idx" ON "Link"("user");

-- CreateIndex
CREATE UNIQUE INDEX "_CartItem_trackingDetails_AB_unique" ON "_CartItem_trackingDetails"("A", "B");

-- CreateIndex
CREATE INDEX "_CartItem_trackingDetails_B_index" ON "_CartItem_trackingDetails"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_ChannelItem_matches_AB_unique" ON "_ChannelItem_matches"("A", "B");

-- CreateIndex
CREATE INDEX "_ChannelItem_matches_B_index" ON "_ChannelItem_matches"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_Match_input_AB_unique" ON "_Match_input"("A", "B");

-- CreateIndex
CREATE INDEX "_Match_input_B_index" ON "_Match_input"("B");

-- AddForeignKey
ALTER TABLE "User" ADD CONSTRAINT "User_role_fkey" FOREIGN KEY ("role") REFERENCES "Role"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "apiKey" ADD CONSTRAINT "apiKey_user_fkey" FOREIGN KEY ("user") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Order" ADD CONSTRAINT "Order_user_fkey" FOREIGN KEY ("user") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Order" ADD CONSTRAINT "Order_shop_fkey" FOREIGN KEY ("shop") REFERENCES "Shop"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TrackingDetail" ADD CONSTRAINT "TrackingDetail_user_fkey" FOREIGN KEY ("user") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "LineItem" ADD CONSTRAINT "LineItem_order_fkey" FOREIGN KEY ("order") REFERENCES "Order"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "LineItem" ADD CONSTRAINT "LineItem_user_fkey" FOREIGN KEY ("user") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CartItem" ADD CONSTRAINT "CartItem_order_fkey" FOREIGN KEY ("order") REFERENCES "Order"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CartItem" ADD CONSTRAINT "CartItem_user_fkey" FOREIGN KEY ("user") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CartItem" ADD CONSTRAINT "CartItem_channel_fkey" FOREIGN KEY ("channel") REFERENCES "Channel"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Channel" ADD CONSTRAINT "Channel_user_fkey" FOREIGN KEY ("user") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ChannelMetafield" ADD CONSTRAINT "ChannelMetafield_channel_fkey" FOREIGN KEY ("channel") REFERENCES "Channel"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ChannelMetafield" ADD CONSTRAINT "ChannelMetafield_user_fkey" FOREIGN KEY ("user") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ChannelItem" ADD CONSTRAINT "ChannelItem_channel_fkey" FOREIGN KEY ("channel") REFERENCES "Channel"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ChannelItem" ADD CONSTRAINT "ChannelItem_user_fkey" FOREIGN KEY ("user") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Shop" ADD CONSTRAINT "Shop_user_fkey" FOREIGN KEY ("user") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ShopMetafield" ADD CONSTRAINT "ShopMetafield_shop_fkey" FOREIGN KEY ("shop") REFERENCES "Shop"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ShopMetafield" ADD CONSTRAINT "ShopMetafield_user_fkey" FOREIGN KEY ("user") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ShopItem" ADD CONSTRAINT "ShopItem_shop_fkey" FOREIGN KEY ("shop") REFERENCES "Shop"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ShopItem" ADD CONSTRAINT "ShopItem_user_fkey" FOREIGN KEY ("user") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Match" ADD CONSTRAINT "Match_user_fkey" FOREIGN KEY ("user") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Link" ADD CONSTRAINT "Link_shop_fkey" FOREIGN KEY ("shop") REFERENCES "Shop"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Link" ADD CONSTRAINT "Link_channel_fkey" FOREIGN KEY ("channel") REFERENCES "Channel"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Link" ADD CONSTRAINT "Link_user_fkey" FOREIGN KEY ("user") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CartItem_trackingDetails" ADD CONSTRAINT "_CartItem_trackingDetails_A_fkey" FOREIGN KEY ("A") REFERENCES "CartItem"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CartItem_trackingDetails" ADD CONSTRAINT "_CartItem_trackingDetails_B_fkey" FOREIGN KEY ("B") REFERENCES "TrackingDetail"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ChannelItem_matches" ADD CONSTRAINT "_ChannelItem_matches_A_fkey" FOREIGN KEY ("A") REFERENCES "ChannelItem"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ChannelItem_matches" ADD CONSTRAINT "_ChannelItem_matches_B_fkey" FOREIGN KEY ("B") REFERENCES "Match"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Match_input" ADD CONSTRAINT "_Match_input_A_fkey" FOREIGN KEY ("A") REFERENCES "Match"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Match_input" ADD CONSTRAINT "_Match_input_B_fkey" FOREIGN KEY ("B") REFERENCES "ShopItem"("id") ON DELETE CASCADE ON UPDATE CASCADE;

